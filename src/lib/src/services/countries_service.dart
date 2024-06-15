import 'dart:convert';

import 'package:http/http.dart';

import '../models/country_model.dart';
import '../utils/http.dart';

class CountriesService {
  CountriesService(this._client);

  final Client _client;

  Future<List<Country>> getAllCountries() async {
    final apiResponse = await _client.get(
      Uri.parse('$apiUrl/Country'),
      headers: returnHttpHeaders(),
    );

    if (apiResponse.statusCode != 200) {
      return [];
    }

    final List decodedResponse = json.decode(
      apiResponse.body,
    );

    return [
      for (final Map<String, dynamic> record in decodedResponse)
        Country.fromJson(record)
    ];
  }
}
