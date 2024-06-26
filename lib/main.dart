import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
    ));
