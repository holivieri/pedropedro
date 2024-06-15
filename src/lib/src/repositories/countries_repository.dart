import '../models/country_model.dart';
import '../services/countries_service.dart';

class CountriesRepository {
  CountriesRepository(this._countriesService);

  final CountriesService _countriesService;

  static List<Country> _cacheList = <Country>[];
  static DateTime _lastUpdate = DateTime.now().toUtc();
  static const maxTimeCache = 1000;

  void clearCache() {
    _cacheList.clear();
  }

  Future<List<Country>> getCountries() async {
    if (_cacheList.isEmpty) {
      _cacheList = await _countriesService.getAllCountries();
      _lastUpdate = DateTime.now().toUtc();
    } else if (DateTime.now().toUtc().difference(_lastUpdate).inMinutes >
        maxTimeCache) {
      _cacheList = await _countriesService.getAllCountries();
      _lastUpdate = DateTime.now().toUtc();
    }
    return _cacheList;
  }
}
