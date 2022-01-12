import 'package:flutter/material.dart';
import 'package:janus/business_layer/view_models/main_screen_view_model.dart';
import 'package:janus/service_layer/service_locator.dart';
import 'package:provider/provider.dart';

class JanusMainScreen extends StatefulWidget {
  const JanusMainScreen({Key? key}) : super(key: key);

  @override
  _JanusMainScreenState createState() => _JanusMainScreenState();
}

class _JanusMainScreenState extends State<JanusMainScreen> {
  MainScreenViewModel model = serviceLocator<MainScreenViewModel>();

  @override
  void initState() {
    model.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainScreenViewModel>(
      create: (context) => model,
      child: Consumer<MainScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Janus app'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => SomeScreen()),
                  // );
                },
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text('First janus widget'),
              Text('Second janus widget')
            ],
          ),
        ),
      ),
    );
  }
}
