import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map? data= {};
  @override
  Widget build(BuildContext context) {
    try {
      data = ModalRoute.of(context)?.settings.arguments as Map;
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: const Icon(Icons.edit_location),
                ),
                const SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data!['location'],
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ], //[]
                ),
                const SizedBox(height: 20.0,),
                Text(
                  data!['time'],
                  style: const TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.0,
                  ),
                )
              ], //[]
            ),
          ),
        ),
      );
    }
    catch(e) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: const Icon(Icons.edit_location),
                ),
                const SizedBox(height: 30.0,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Could not find location",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ], //[]
                ),
                const SizedBox(height: 20.0,),
                const Text(
                  "Could not get time",
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 30.0,),
                Text(
                  "$e",
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
              ], //[]
            ),
          ),
        ),
      );;
    }

  }
}
