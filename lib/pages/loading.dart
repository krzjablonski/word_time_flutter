import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:world_time/services/models/time.dart';
import 'package:world_time/services/api_service.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late Time time;
  late Map data;

  void loadTime(String zone, String location) async {
    try {
      time = await ApiService.getTime(zone, location);
      String formattedTime = DateFormat.jm().format(time.time);

      Navigator.pushReplacementNamed(context, '/time', arguments: {
        'time': formattedTime,
        'location': time.location,
        'flag': time.flag,
        'isDayTime': time.isDayTime
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;

    loadTime(data['zone'], data['location']);

    return const Scaffold(
        backgroundColor: Colors.blue,
        body: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ));
  }
}
