import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations =  [
    WorldTime(location: "Berlin", flag: "Europe.png", url: "Europe/Berlin"),
    WorldTime(location: "London", flag: "Europe.png", url: "Europe/London"),
    WorldTime(location: "Cairo", flag: "Africa.png", url: "Africa/Cairo"),
    WorldTime(location: "Chicago", flag: "America.png", url: "America/Chicago"),
    WorldTime(location: "Kolkata", flag: "India.png", url: "Asia/Kolkata"),
    WorldTime(location: "Seoul", flag: "Korea.png", url: "Asia/Seoul"),
    WorldTime(location: "Jakarta", flag: "Indonesia.png", url: "Asia/Jakarta"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
            child: Card(
              elevation: 20.0,
              child: ListTile(
                onTap: () async {
                  WorldTime instance = WorldTime(
                      location: locations[index].location,
                      flag: locations[index].flag,
                      url: locations[index].url);
                  await instance.getTime();
                  Navigator.pop(context, {
                    'location': instance.location,
                    'flag': instance.flag,
                    'time': instance.time,
                  });
                },
                title: Text(
                  locations[index].location
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
