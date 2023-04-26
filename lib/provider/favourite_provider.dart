import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  final List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItems(int value) {
    selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    selectedItem.remove(value);
    notifyListeners();
  }
}
