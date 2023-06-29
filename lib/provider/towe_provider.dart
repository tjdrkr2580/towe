import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _username;

  String? get username => _username;

  void setAuthData(String username) {
    _username = username;
    notifyListeners();
  }

  void reset() {
    _username = null;
  }
}
