import 'package:mockito/mockito.dart';
import 'package:template_app/src/services/analytics_service.dart';

class AnalyticsMock extends Mock implements AnalyticService {
  @override
  Future<void> setUserProperties(String userId) async {
    // this does nothing, it is just for testing.
  }
}
