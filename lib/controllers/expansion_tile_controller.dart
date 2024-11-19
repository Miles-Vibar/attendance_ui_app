import 'package:flutter/material.dart';

class CustomExpansionTileController extends ChangeNotifier {
  bool _expanded = false;

  bool get expanded => _expanded;

  void collapseOrExpand(bool expanded) {
    _expanded = expanded;
    notifyListeners();
  }
}