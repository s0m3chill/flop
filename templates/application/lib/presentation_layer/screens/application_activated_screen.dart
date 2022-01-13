import 'package:application/business_layer/models/application_model.dart';
import 'package:application/presentation_layer/widgets/application_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationActivatedScreen extends StatelessWidget {
  static String routeName = '/activated_page';

  const ApplicationActivatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activated configs'),
      ),
      body: Consumer<ApplicationModel>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.items.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) => Dismissible(
            key: Key('${value.items[index]}'),
            onDismissed: (direction) {
              Provider.of<ApplicationModel>(context, listen: false)
                  .remove(value.items[index]);
              Scaffold.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Removed from configs'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: ApplicationWidget(value.items[index]),
            background: Container(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
