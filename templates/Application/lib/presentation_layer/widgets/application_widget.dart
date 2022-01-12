import 'package:application/business_layer/models/application_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ApplicationWidget extends StatelessWidget {
  final int itemNo;
  static const double _sliderSize = 80;

  const ApplicationWidget(
    this.itemNo,
  );

  @override
  Widget build(BuildContext context) {
    var itemList = Provider.of<ApplicationModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const SizedBox(
          width: _sliderSize,
          height: _sliderSize,
          child: SleekCircularSlider(
            min: 0,
            max: 100,
            initialValue: 50,
            appearance: CircularSliderAppearance(
              size: _sliderSize,
            ),
          ),
        ),
        title: Text(
          'Application config $itemNo',
          key: Key('item_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: itemList.items.contains(itemNo)
              ? const Icon(Icons.flag)
              : const Icon(Icons.outlined_flag),
          onPressed: () {
            !itemList.items.contains(itemNo)
                ? itemList.add(itemNo)
                : itemList.remove(itemNo);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(itemList.items.contains(itemNo)
                    ? 'Config activated'
                    : 'Config deactivated'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
