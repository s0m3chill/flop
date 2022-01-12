import 'package:application/presentation_layer/widgets/application_widget.dart';
import 'package:flutter/material.dart';
import 'application_activated_screen.dart';

class ApplicationMainScreen extends StatelessWidget {
  static String routeName = '/';

  const ApplicationMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Config Testing'),
        actions: <Widget>[
          TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, ApplicationActivatedScreen.routeName);
            },
            icon: const Icon(Icons.done_all),
            label: const Text('Active'),
            key: const Key('application'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        //shrinkWrap: true,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ApplicationWidget(index),
      ),
    );
  }
}
