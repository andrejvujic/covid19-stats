import 'dart:convert';
import 'package:http/http.dart';
import 'package:covid19_stats/services/keys.dart';

class Api {
  static String key = Keys.rapidApiKey;
  static String accessToken = Keys.postManAccessToken;

  static Future<List<dynamic>> getCountryData({
    String countryCode,
    String countrySlug,
  }) async {
    /*
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
    */

    final Map<String, String> queryParameters = {};

    final Uri uri = Uri.https('api.covid19api.com',
        '/live/country/$countrySlug/status/confirmed', queryParameters);

    try {
      final Response response = await get(
        uri,
        headers: {
          'X-Request-Id': accessToken,
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      return [];
    }
  }

  static Future<Map<dynamic, dynamic>> getTotalData() async {
    final Map<String, String> queryParameters = {};

    final Uri uri =
        Uri.https('api.covid19api.com', '/summary', queryParameters);

    try {
      final Response response = await get(
        uri,
        headers: {
          'X-Request-Id': accessToken,
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {};
    }
  }
}
