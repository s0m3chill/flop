import 'package:flutter/material.dart';
import 'package:template/presentation_layer/screens/template_main_screen.dart';
import 'package:template/service_layer/service_locator.dart';

void main() {
  configureServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template app',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const TemplateMainScreen(),
    );
  }
}
