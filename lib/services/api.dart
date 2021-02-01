import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'package:covid19_stats/services/keys.dart';

class Api {
  static String key = Keys.rapidApiKey;

  static Future<List<dynamic>> getCountryData(
    String countryCode,
  ) async {
    final Map<String, String> queryParameters = {
      "code": countryCode,
    };

    final Uri uri = Uri.https(
        'covid-19-data.p.rapidapi.com', '/country/code', queryParameters);

    try {
      final Response response = await get(
        uri,
        headers: {
          "x-rapidapi-key": key,
          "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
          "useQueryString": 'true'
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      return [];
    }
  }
}
