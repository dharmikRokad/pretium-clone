import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._();

  static final SharedPrefs _instance = SharedPrefs._();

  static SharedPrefs get i => _instance;

  late final SharedPreferences _prefs;

  final String _isLoggedIn = "is_logged_in";

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Is_onboarded ///

  bool get isLoggedIn =>
      _prefs.getBool(_isLoggedIn) ?? false;

  Future<bool> setIsLoggedIn(Map<String, dynamic> user) => _prefs.setString(
        _isLoggedIn,
        jsonEncode(user),
      );

  Future<bool> removeIsLoggedIn() => _prefs.remove(_isLoggedIn);
}