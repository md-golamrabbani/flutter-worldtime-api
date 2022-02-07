import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class EditLocation extends StatefulWidget {
  const EditLocation({Key? key}) : super(key: key);

  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Australia ', url: 'Australia/Sydney', flag: 'au.png'),
    WorldTime(location: 'Bangladesh ', url: 'Asia/Dhaka', flag: 'bd.png'),
    WorldTime(location: 'China ', url: 'Asia/Hong_Kong', flag: 'cn.png'),
    WorldTime(location: 'Germany ', url: 'Europe/Berlin', flag: 'de.png'),
    WorldTime(location: 'Japan', url: 'Asia/Tokyo', flag: 'jp.png'),
    WorldTime(location: 'Russia', url: 'Europe/Bucharest', flag: 'ru.png'),
    WorldTime(location: 'United State', url: 'America/New_York', flag: 'us.png')
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/${locations[index].flag}'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
