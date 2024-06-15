import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_app/src/models/notification_model.dart';
import 'package:template_app/src/models/user_preferences.dart';
import 'package:template_app/src/repositories/notifications_repository.dart';
import 'package:template_app/src/services/notifications_service.dart';

import '../mocks/firebase_analytics_mock.dart';
import '../mocks/http_verbs_mock.dart';
import '../mocks/mock_entities.dart';
import '../mocks/mocks.mocks.dart';

void main() {
  group('Notifications Tests', () {
    late MockClient mockClient;

    setUpAll(() async {
      mockClient = MockClient();
      SharedPreferences.setMockInitialValues(
          {'userName': 'HernanTest', 'token': 'testToken'});
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('userName', 'HernanTest');
      await pref.setString('token', 'Test_Token');
      UserPreferences.mock(pref);
      AnalyticsMock();
    });

    test('> Get my notifications', () async {
      mockGetList(
        httpmockClient: mockClient,
        statusCode: 200,
        json: notifications,
      );

      final NotificationsRespository repo =
          NotificationsRespository(NotificationsService(mockClient));

      final result = await repo.getNotifications();

      expect(result, isA<List<Notification>>());
      expect(result.length, 1);
    });

    test('> Can delete a notification', () async {
      mockPost(
        httpmockClient: mockClient,
        statusCode: 200,
        result: 'true',
      );

      final NotificationsRespository repo =
          NotificationsRespository(NotificationsService(mockClient));

      final result =
          await repo.deleteNotification('208fb0fe-cda7-4932-abd8-21f98874e005');
      expect(result, true);
    });

    test('> Cannot delete a notification if endpoint does not work', () async {
      mockPost(
        httpmockClient: mockClient,
        statusCode: 400,
        result: 'true',
      );

      final NotificationsRespository repo =
          NotificationsRespository(NotificationsService(mockClient));

      final result =
          await repo.deleteNotification('208fb0fe-cda7-4932-abd8-21f98874e005');
      expect(result, false);
    });
  });
}
