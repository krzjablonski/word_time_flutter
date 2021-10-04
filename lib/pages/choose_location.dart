import 'package:flutter/material.dart';
import 'package:world_time/services/models/time_list_item.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<TimeListItem> locations = [
    TimeListItem(zone: 'Europe', location: 'London', flag: 'uk.png'),
    TimeListItem(zone: 'Europe', location: 'Athens', flag: 'greece.png'),
    TimeListItem(zone: 'Africa', location: 'Cairo', flag: 'egypt.png'),
    TimeListItem(zone: 'Africa', location: 'Nairobi', flag: 'kenya.png'),
    TimeListItem(zone: 'America', location: 'Chicago', flag: 'usa.png'),
    TimeListItem(zone: 'America', location: 'New York', flag: 'usa.png'),
    TimeListItem(zone: 'Asia', location: 'Seoul', flag: 'south_korea.png'),
    TimeListItem(zone: 'Asia', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Choose Location'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () async {
                  try {
                    Navigator.pushNamed(context, '/loading', arguments: {
                      'zone': locations[index].zone,
                      'location': locations[index].location
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(backgroundImage: AssetImage('assets/images/${locations[index].flag}')),
              )
            ),
          );
        },
      )
    );
  }
}
