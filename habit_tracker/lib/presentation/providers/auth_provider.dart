import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../../data/datasources/local_datasource.dart';
import '../../data/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final LocalDataSource _localDataSource;
  
  User? _user;
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _error;

  AuthProvider(this._localDataSource) {
    _checkLoginStatus();
  }

  User? get user => _user;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void _checkLoginStatus() {
    _isLoggedIn = _localDataSource.isLoggedIn();
    if (_isLoggedIn) {
      _user = _localDataSource.getUser();
    }
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String username,
    required int age,
    required String country,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final user = User(
        id: const Uuid().v4(),
        name: name,
        username: username,
        age: age,
        country: country,
        createdAt: DateTime.now(),
      );
      
      await _localDataSource.saveUser(user);
      _user = user;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'Registration failed. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulated authentication - in real app, validate against stored user
      final storedUser = _localDataSource.getUser();
      
      if (storedUser != null && storedUser.username == username) {
        await _localDataSource.setLoggedIn(true);
        _user = storedUser;
        _isLoggedIn = true;
        _isLoading = false;
        notifyListeners();
        return true;
      }
      
      // For demo purposes, allow default login
      if (username == 'demo' && password == 'demo') {
        final user = User(
          id: const Uuid().v4(),
          name: 'Demo User',
          username: 'demo',
          age: 25,
          country: 'United States',
          createdAt: DateTime.now(),
        );
        await _localDataSource.saveUser(user);
        await _localDataSource.setLoggedIn(true);
        _user = user;
        _isLoggedIn = true;
        _isLoading = false;
        notifyListeners();
        return true;
      }

      _error = 'Invalid username or password';
      _isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _error = 'Login failed. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await _localDataSource.setLoggedIn(false);
    _user = null;
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<bool> updateProfile({
    required String name,
    required String username,
    required int age,
    required String country,
  }) async {
    if (_user == null) return false;

    _isLoading = true;
    notifyListeners();

    try {
      final updatedUser = _user!.copyWith(
        name: name,
        username: username,
        age: age,
        country: country,
      );
      
      await _localDataSource.saveUser(updatedUser);
      _user = updatedUser;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}