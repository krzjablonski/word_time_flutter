import 'package:intl/intl.dart';

/// Data class holding data fetched from wordtimeapi. It's bein instantiated by ApiService
class Time {
  DateTime time;
  String flag;
  String location;
  bool isDayTime;

  Time({required this.time, required this.flag, required this.location, required this.isDayTime});

  factory Time.fromJson(Map jsonData) {
    if (jsonData.isEmpty) {
      throw Exception('Provided json is empty');
    }

    DateTime dateTime = DateTime.parse(jsonData['datetime']);
    String offset = jsonData['offset'];
    String offsetSubstring = offset.substring(1, 3);

    dateTime = dateTime.add(Duration(hours: int.parse(offsetSubstring)));

    final bool isDayTime = dateTime.hour > 6 && dateTime.hour < 20;

    return Time(
        time: dateTime, flag: jsonData['flag'], location: jsonData['location'], isDayTime: isDayTime);
  }

  @override
  toString() {
    return DateFormat.jm().format(time);
  }
}
