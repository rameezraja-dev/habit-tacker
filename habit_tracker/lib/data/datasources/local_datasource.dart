import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../models/habit_model.dart';

class LocalDataSource {
  final SharedPreferences _prefs;

  static const String _userKey = 'user';
  static const String _habitsKey = 'habits';
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _darkModeKey = 'darkMode';
  static const String _notificationsKey = 'notificationsEnabled';
  static const String _selectedHabitIdsKey = 'selectedHabitIds';

  LocalDataSource(this._prefs);

  Future<void> saveUser(User user) async {
    await _prefs.setString(_userKey, user.toJson());
  }

  User? getUser() {
    final userJson = _prefs.getString(_userKey);
    if (userJson == null) return null;
    return User.fromJson(userJson);
  }

  Future<void> deleteUser() async {
    await _prefs.remove(_userKey);
  }

  Future<void> saveHabits(List<Habit> habits) async {
    final habitsJson = habits.map((h) => h.toJson()).toList();
    await _prefs.setStringList(_habitsKey, habitsJson);
  }

  List<Habit> getHabits() {
    final habitsJson = _prefs.getStringList(_habitsKey);
    if (habitsJson == null) return [];
    return habitsJson.map((h) => Habit.fromJson(h)).toList();
  }

  Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool(_isLoggedInKey, value);
  }

  bool isLoggedIn() {
    return _prefs.getBool(_isLoggedInKey) ?? false;
  }

  Future<void> setDarkMode(bool value) async {
    await _prefs.setBool(_darkModeKey, value);
  }

  bool isDarkMode() {
    return _prefs.getBool(_darkModeKey) ?? false;
  }

  Future<void> setNotificationsEnabled(bool value) async {
    await _prefs.setBool(_notificationsKey, value);
  }

  bool isNotificationsEnabled() {
    return _prefs.getBool(_notificationsKey) ?? true;
  }

  Future<void> setSelectedHabitIds(List<String> ids) async {
    await _prefs.setStringList(_selectedHabitIdsKey, ids);
  }

  List<String> getSelectedHabitIds() {
    return _prefs.getStringList(_selectedHabitIdsKey) ?? [];
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }
}