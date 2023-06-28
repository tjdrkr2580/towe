import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _username;

  String? get token => _token;
  String? get username => _username;

  void setAuthData(String token, String username) {
    _token = token;
    _username = username;
    notifyListeners();
  }

  void reset() {
    _token = null;
    _username = null;
  }
}
