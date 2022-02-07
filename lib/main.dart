import 'package:flutter/material.dart';
import 'package:world_time/pages/edit_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/edit_location': (context) => const EditLocation(),
    },
  ));
}
