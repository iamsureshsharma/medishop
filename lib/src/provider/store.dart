import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isLoading = false;

  bool _autoValidate = false;

  String _userEmail = '';

  bool get isLoading => _isLoading;

  bool get autoValidate => _autoValidate;

  String get userEmail => _userEmail;

  setIsLoading(bool value, {willNotify = true}) {
    _isLoading = value;
    if (willNotify) notifyListeners();
  }

  setAutoValidate(bool value, {willNotify = true}) {
    _autoValidate = value;
    if (willNotify) notifyListeners();
  }

  setUserEmail(String value, {bool willNotify = true}) {
    _userEmail = value;
    if (willNotify) notifyListeners();
  }
}
