import 'package:flutter/material.dart';

class ApplicationController<T> with ChangeNotifier {
  List<T> items = [];

  // Add item
  void addItem(T item) {
    items.add(item);
    notifyListeners();
  }

  void equal(T item) {
    items.add(item);
    notifyListeners();
  }

  void delete(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
