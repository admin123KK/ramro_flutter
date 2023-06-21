import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
   bool _isDarkMode = false; // default light mode
  static const String _themePreferenceKey = 'Themeprefernce';
  bool get isDarkMode => _isDarkMode;

  ThemeNotifier() {
    _loadThemePreference();
  }
  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool(_themePreferenceKey) ?? false;
    notifyListeners();
  }

  Future<void> _saveThemePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themePreferenceKey, value);
  }

  void toggleTheme() {
    _isDarkMode =!_isDarkMode;
    _saveThemePreference(_isDarkMode);
    notifyListeners();
  }
}