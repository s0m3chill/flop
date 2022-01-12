import 'package:flutter/material.dart';
import 'package:janus/presentation_layer/screens/janus_main_screen.dart';
import 'package:janus/service_layer/service_locator.dart';

void main() {
  configureServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janus app',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const JanusMainScreen(),
    );
  }
}
