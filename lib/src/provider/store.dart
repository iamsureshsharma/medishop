import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isLoading = false;

  bool _autoValidate = false;

  bool get isLoading => _isLoading;

  bool get autoValidate => _autoValidate;

  setIsLoading(bool value, {willNotify = true}) {
    _isLoading = value;
    if (willNotify) notifyListeners();
  }

  setAutoValidate(bool value, {willNotify = true}) {
    _autoValidate = value;
    if (willNotify) notifyListeners();
  }
}
