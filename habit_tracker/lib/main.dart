import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'data/datasources/local_datasource.dart';
import 'data/datasources/api_datasource.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/habit_provider.dart';
import 'presentation/providers/quote_provider.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/providers/notification_provider.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  
  final localDataSource = LocalDataSource(prefs);
  final apiDataSource = ApiDataSource();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(localDataSource)),
        ChangeNotifierProvider(create: (_) => AuthProvider(localDataSource)),
        ChangeNotifierProvider(create: (_) => HabitProvider(localDataSource)),
        ChangeNotifierProvider(create: (_) => QuoteProvider(apiDataSource)),
        ChangeNotifierProvider(create: (_) => NotificationProvider(localDataSource)),
      ],
      child: const HabitTrackerApp(),
    ),
  );
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'Habit Tracker',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: Consumer<AuthProvider>(
            builder: (context, authProvider, _) {
              if (authProvider.isLoading) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              return authProvider.isLoggedIn ? const HomeScreen() : const LoginScreen();
            },
          ),
        );
      },
    );
  }
}