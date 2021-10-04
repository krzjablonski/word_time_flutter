import 'dart:convert';

import 'package:world_time/services/models/time.dart';
import 'package:http/http.dart';

/// Class used to fetch data from the internet and save these in Time object
abstract class ApiService {
  static Future<Time> getTime(String zone, String location) async {
    try {
      Map<String, String> data = {};
      String url = 'http://worldtimeapi.org/api/timezone/$zone/${location.replaceAll(' ', '_')}';
      Uri uri = Uri.parse(url);
      Response res = await get(uri);
      Map response = jsonDecode(res.body);
      data['datetime'] = response['utc_datetime'];
      data['offset'] = response['utc_offset'];
      data['flag'] = 'germany.png';
      data['location'] = location;

      Time time = Time.fromJson(data);

      return time;
    } catch (e) {
      rethrow;
    }
  }
}
