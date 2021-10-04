import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data;
  String time = '';
  String location = '';

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;

    String time = data['time'];
    String location = data['location'];
    bool? isDayTime = data['isDayTime'];

    String bgName = isDayTime == null || isDayTime ? 'day.png' : 'night.png';

    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$bgName'),
                fit: BoxFit.cover
            )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 180.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                        Icons.edit_location,
                        color: Colors.white60,
                    ),
                    label: const Text('Edit Location', style: TextStyle(color: Colors.white60)),
                ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(location, style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w800, letterSpacing: 1.0, color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  time,
                  style: const TextStyle(fontSize: 60.0, fontWeight: FontWeight.w300, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
