import 'package:flutter/cupertino.dart';

class ApplicationModel extends ChangeNotifier {
  final List<int> _items = [];
  List<int> get items => _items;

  void add(int item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(int item) {
    _items.remove(item);
    notifyListeners();
  }
}
