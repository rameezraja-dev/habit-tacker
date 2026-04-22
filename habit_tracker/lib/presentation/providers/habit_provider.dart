import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../../data/datasources/local_datasource.dart';
import '../../data/models/habit_model.dart';

class HabitProvider extends ChangeNotifier {
  final LocalDataSource _localDataSource;
  
  List<Habit> _habits = [];
  bool _isLoading = false;
  String? _error;

  HabitProvider(this._localDataSource) {
    loadHabits();
  }

  List<Habit> get habits => _habits;
  List<Habit> get completedHabits => _habits.where((h) => h.isCompleted).toList();
  List<Habit> get pendingHabits => _habits.where((h) => !h.isCompleted).toList();
  int get completedCount => completedHabits.length;
  int get totalCount => _habits.length;
  double get completionRate => totalCount > 0 ? completedCount / totalCount : 0;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void loadHabits() {
    _habits = _localDataSource.getHabits();
    notifyListeners();
  }

  Future<bool> addHabit({
    required String name,
    required String description,
    required String frequency,
    required int color,
    required bool notifyEnabled,
    required List<String> notificationTimes,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final habit = Habit(
        id: const Uuid().v4(),
        name: name,
        description: description,
        frequency: frequency,
        color: color,
        notifyEnabled: notifyEnabled,
        notificationTimes: notificationTimes,
        createdAt: DateTime.now(),
      );

      _habits.add(habit);
      await _localDataSource.saveHabits(_habits);
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'Failed to add habit';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateHabit(Habit habit) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final index = _habits.indexWhere((h) => h.id == habit.id);
      if (index != -1) {
        _habits[index] = habit;
        await _localDataSource.saveHabits(_habits);
      }
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'Failed to update habit';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteHabit(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _habits.removeWhere((h) => h.id == id);
      await _localDataSource.saveHabits(_habits);
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'Failed to delete habit';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> toggleHabitCompletion(String id) async {
    try {
      final index = _habits.indexWhere((h) => h.id == id);
      if (index != -1) {
        final habit = _habits[index];
        if (habit.isCompleted) {
          _habits[index] = habit.markIncomplete();
        } else {
          _habits[index] = habit.markCompleted();
        }
        await _localDataSource.saveHabits(_habits);
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _error = 'Failed to update habit';
      notifyListeners();
      return false;
    }
  }

  List<Habit> getHabitsForDate(DateTime date) {
    return _habits.where((h) {
      if (h.completedAt == null) return false;
      final completedDate = h.completedAt!;
      return completedDate.year == date.year &&
             completedDate.month == date.month &&
             completedDate.day == date.day;
    }).toList();
  }

  Map<DateTime, List<Habit>> getWeeklyProgress() {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final progress = <DateTime, List<Habit>>{};

    for (int i = 0; i < 7; i++) {
      final date = weekStart.add(Duration(days: i));
      progress[date] = getHabitsForDate(date);
    }

    return progress;
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}