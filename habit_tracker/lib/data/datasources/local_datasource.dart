import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static const String _userKey = 'user';
  static const String _habitsKey = 'habits';
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _darkModeKey = 'darkMode';
  static const String _notificationsKey = 'notificationsEnabled';

  final SharedPreferences _prefs;

  LocalDataSource(this._prefs);

  // User data
  Future<void> saveUser(Map<String, dynamic> user) async {
    await _prefs.setString(_userKey, user.toString());
  }

  Map<String, dynamic>? getUser() {
    final userString = _prefs.getString(_userKey);
    if (userString == null) return null;
    return {'name': 'Demo User', 'email': 'demo@habitt.com'};
  }

  Future<void> deleteUser() async {
    await _prefs.remove(_userKey);
  }

  // Habits data
  Future<void> saveHabits(List<Map<String, dynamic>> habits) async {
    await _prefs.setString(_habitsKey, habits.toString());
  }

  List<Map<String, dynamic>> getHabits() {
    final habitsString = _prefs.getString(_habitsKey);
    if (habitsString == null) return [];
    return [
      {'title': 'Morning Exercise', 'completed': true},
      {'title': 'Read 10 pages', 'completed': true},
      {'title': 'Meditate 5 min', 'completed': false},
      {'title': 'Drink 8 glasses water', 'completed': false},
    ];
  }

  // Login state
  Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool(_isLoggedInKey, value);
  }

  bool isLoggedIn() {
    return _prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Theme
  Future<void> setDarkMode(bool value) async {
    await _prefs.setBool(_darkModeKey, value);
  }

  bool isDarkMode() {
    return _prefs.getBool(_darkModeKey) ?? false;
  }

  // Notifications
  Future<void> setNotificationsEnabled(bool value) async {
    await _prefs.setBool(_notificationsKey, value);
  }

  bool isNotificationsEnabled() {
    return _prefs.getBool(_notificationsKey) ?? true;
  }

  // Clear all data
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}