import 'package:flutter/foundation.dart';
import '../../data/datasources/local_datasource.dart';

class ThemeProvider extends ChangeNotifier {
  final LocalDataSource _localDataSource;
  
  bool _isDarkMode = false;

  ThemeProvider(this._localDataSource) {
    _loadTheme();
  }

  bool get isDarkMode => _isDarkMode;

  void _loadTheme() {
    _isDarkMode = _localDataSource.isDarkMode();
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _localDataSource.setDarkMode(_isDarkMode);
    notifyListeners();
  }

  Future<void> setDarkMode(bool value) async {
    _isDarkMode = value;
    await _localDataSource.setDarkMode(_isDarkMode);
    notifyListeners();
  }
}