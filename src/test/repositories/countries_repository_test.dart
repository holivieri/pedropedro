import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_app/src/models/country_model.dart';
import 'package:template_app/src/models/user_preferences.dart';
import 'package:template_app/src/repositories/countries_repository.dart';
import 'package:template_app/src/services/countries_service.dart';

import '../mocks/firebase_analytics_mock.dart';
import '../mocks/http_verbs_mock.dart';
import '../mocks/mock_entities.dart';
import '../mocks/mocks.mocks.dart';

void main() {
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

  group('Countries', () {
    test('Get all countries', () async {
      mockGetList(
        httpmockClient: mockClient,
        statusCode: 200,
        json: countries,
      );

      final CountriesRepository repo =
          CountriesRepository(CountriesService(mockClient));

      final result = await repo.getCountries();

      expect(result, isA<List<Country>>());
      expect(result.length, 3);
    });

    test('> Get All countries return an empty list if endpoint does not work',
        () async {
      mockGetList(
        httpmockClient: mockClient,
        statusCode: 400,
        json: [],
      );

      final CountriesRepository repo =
          CountriesRepository(CountriesService(mockClient))..clearCache();

      final result = await repo.getCountries();

      expect(result, isA<List<Country>>());
      expect(result.length, 0);
    });
  });
}
