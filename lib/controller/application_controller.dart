import 'package:flutter/material.dart';

class ApplicationController<T> extends ChangeNotifier {
  List<T> _list = [];
  List<T> _filteredList = [];

  List<T> get items => _filteredList.isNotEmpty ? _filteredList : _list;

  void addItem(T data) {
    _list.add(data);
    notifyListeners();
  }

  void equal(List<T> data) {
    _list = data;
    _filteredList = []; // Reset filtered list when new data is assigned
    notifyListeners();
  }

  void search(String p0, String Function(T) get) {
    if (p0.isEmpty) {
      _filteredList = []; // Clear filtered list if query is empty
    } else {
      _filteredList = _list.where((item) {
        final name = get(item).toLowerCase();
        return name.contains(p0.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void editItem(T updatedItem, bool Function(T, T) areEqual) {
    final index = _list.indexWhere((item) => areEqual(item, updatedItem));
    if (index != -1) {
      _list[index] = updatedItem; // Update the item in the list
      // Also update the filtered list if it's being used
      final filteredIndex = _filteredList.indexWhere(
        (item) => areEqual(item, updatedItem),
      );
      if (filteredIndex != -1) {
        _filteredList[filteredIndex] = updatedItem;
      }
      notifyListeners(); // Notify listeners to update the UI
    }
  }

  // New method to delete an item by its index
  void delete(int index) {
    if (index >= 0 && index < _list.length) {
      _list.removeAt(index);
      // Also remove from the filtered list if it was filtered
      if (_filteredList.isNotEmpty) {
        _filteredList.removeAt(index);
      }
      notifyListeners(); // Notify listeners to update the UI
    }
  }
}
