import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_app/src/models/user_preferences.dart';
import 'package:mockito/mockito.dart';

import '../mocks/firebase_analytics_mock.dart';
import '../mocks/mocks.mocks.dart';

void main() {
  late MockClient httpClient;

  group('UI TESTS', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues(
          {'userName': 'HernanTest', 'token': 'testToken'});
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('userName', 'HernanTest');
      await pref.setString('token', 'Test_Token');
      UserPreferences.mock(pref);
      AnalyticsMock();

      httpClient = MockClient();

      when(httpClient.get(Uri.parse('test url here'),
              headers: anyNamed('headers')))
          .thenAnswer((_) {
        final mockResponse = Response(
          "[{Id: '0c8f991c-2268-433d-a413-fb2e58966207', Name: 'Aerosmith', Bio:'', PictureUrl:'', CreatedDate: '10/10/22', Folowers: 200, deleted: false, Sponsored: true}]",
          200,
        );
        return Future.value(mockResponse);
      });
    });

    // testWidgets('Home Page test', (WidgetTester tester) async {
    //   TestWidgetsFlutterBinding.ensureInitialized();

    //   when(concertService.getNextConcerts())
    //       .thenAnswer((_) => Future.value([]));

    //   when(genresService.getAllGenres()).thenAnswer((_) => Future.value([]));

    //   when(placesService.getAllPlaces()).thenAnswer((_) => Future.value([]));

    //   when(artistService.getMyArtists()).thenAnswer((_) => Future.value([]));

    //   await tester.pumpWidget(const LocalizationsInj(child: HomePage()));
    // });
  });
}
