import 'package:application/business_layer/models/application_model.dart';
import 'package:application/presentation_layer/screens/application_activated_screen.dart';
import 'package:application/presentation_layer/screens/application_main_screen.dart';
import 'package:application/service_layer/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  configureServiceLocator();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicationModel>(
      create: (context) => ApplicationModel(),
      child: MaterialApp(
        title: 'Application Config Testing',
        routes: {
          ApplicationMainScreen.routeName: (context) => const ApplicationMainScreen(),
          ApplicationActivatedScreen.routeName: (context) => const ApplicationActivatedScreen(),
        },
        initialRoute: ApplicationMainScreen.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}