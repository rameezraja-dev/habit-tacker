class AppConstants {
  static const String appName = 'Habit Tracker';
  static const String appVersion = '1.0.0';

  static const String quotesApiUrl = 'https://api.quotable.io/random';

  static const List<String> defaultCountries = [
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'Japan',
    'India',
    'Brazil',
    'Mexico',
  ];

  static const List<int> habitColors = [
    0xFF6366F1,
    0xFF10B981,
    0xFFF59E0B,
    0xFFEF4444,
    0xFF8B5CF6,
    0xFFEC4899,
    0xFF06B6D4,
    0xFF84CC16,
  ];

  static const List<String> notificationTimes = [
    'Morning',
    'Afternoon',
    'Evening',
  ];

  static const Map<String, String> defaultNotificationTimes = {
    'Morning': '08:00',
    'Afternoon': '14:00',
    'Evening': '19:00',
  };
}