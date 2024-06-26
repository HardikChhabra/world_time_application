import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time;

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: "Kolkata", flag: "India", url: "asia/kolkata");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Text(time ?? 'loading...'),
    );
  }
}
