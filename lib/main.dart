import 'package:flutter/material.dart';
import 'package:open_maps_example/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),

      debugShowCheckedModeBanner: false,

      home: const Homescreen(),
    );
  }
}
