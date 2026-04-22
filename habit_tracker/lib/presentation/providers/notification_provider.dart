import 'package:flutter/foundation.dart';
import '../../data/datasources/local_datasource.dart';
import '../../core/constants/app_constants.dart';

class NotificationProvider extends ChangeNotifier {
  final LocalDataSource _localDataSource;
  
  bool _notificationsEnabled = true;
  List<String> _selectedHabitIds = [];

  NotificationProvider(this._localDataSource) {
    _loadSettings();
  }

  bool get notificationsEnabled => _notificationsEnabled;
  List<String> get selectedHabitIds => _selectedHabitIds;

  void _loadSettings() {
    _notificationsEnabled = _localDataSource.isNotificationsEnabled();
    _selectedHabitIds = _localDataSource.getSelectedHabitIds();
    notifyListeners();
  }

  Future<void> toggleNotifications() async {
    _notificationsEnabled = !_notificationsEnabled;
    await _localDataSource.setNotificationsEnabled(_notificationsEnabled);
    notifyListeners();
  }

  Future<void> setNotificationsEnabled(bool value) async {
    _notificationsEnabled = value;
    await _localDataSource.setNotificationsEnabled(_notificationsEnabled);
    notifyListeners();
  }

  Future<void> toggleHabitNotification(String habitId) async {
    if (_selectedHabitIds.contains(habitId)) {
      _selectedHabitIds.remove(habitId);
    } else {
      _selectedHabitIds.add(habitId);
    }
    await _localDataSource.setSelectedHabitIds(_selectedHabitIds);
    notifyListeners();
  }

  bool isHabitSelected(String habitId) {
    return _selectedHabitIds.contains(habitId);
  }

  String getNotificationTime(String timeSlot) {
    return AppConstants.defaultNotificationTimes[timeSlot] ?? '08:00';
  }

  Map<String, bool> getDefaultTimes() {
    return {
      'Morning': true,
      'Afternoon': false,
      'Evening': false,
    };
  }
}