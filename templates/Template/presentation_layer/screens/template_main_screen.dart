import 'package:flutter/material.dart';
import 'package:template/business_layer/view_models/main_screen_view_model.dart';
import 'package:template/service_layer/service_locator.dart';
import 'package:provider/provider.dart';

class TemplateMainScreen extends StatefulWidget {
  const TemplateMainScreen({Key? key}) : super(key: key);

  @override
  _TemplateMainScreenState createState() => _TemplateMainScreenState();
}

class _TemplateMainScreenState extends State<TemplateMainScreen> {
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
            title: const Text('Template app'),
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
              Text('First template widget'),
              Text('Second template widget')
            ],
          ),
        ),
      ),
    );
  }
}
