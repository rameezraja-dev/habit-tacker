import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiDataSource {
  // Using quotable.io API for motivational quotes
  static const String _quotesUrl = 'https://api.quotable.io/random';
  
  // Fallback quotes in case API is unavailable
  static const List<Map<String, String>> _fallbackQuotes = [
    {'content': 'The secret of getting ahead is getting started.', 'author': 'Mark Twain'},
    {'content': 'It does not matter how slowly you go as long as you do not stop.', 'author': 'Confucius'},
    {'content': 'Success is not final, failure is not fatal: it is the courage to continue that counts.', 'author': 'Winston Churchill'},
    {'content': 'The only way to do great work is to love what you do.', 'author': 'Steve Jobs'},
    {'content': 'Believe you can and you\'re halfway there.', 'author': 'Theodore Roosevelt'},
  ];

  Future<Map<String, String>> fetchQuote() async {
    try {
      final response = await http.get(Uri.parse(_quotesUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'content': data['content'] ?? '',
          'author': data['author'] ?? 'Unknown',
        };
      }
    } catch (e) {
      // Return fallback on error
    }
    return _getRandomFallbackQuote();
  }

  Map<String, String> _getRandomFallbackQuote() {
    final random = DateTime.now().millisecondsSinceEpoch % _fallbackQuotes.length;
    return _fallbackQuotes[random];
  }

  // Example of another API integration
  Future<Map<String, dynamic>> fetchQuoteFromAPI() async {
    try {
      final response = await http.get(Uri.parse(_quotesUrl));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      // Handle error
    }
    return _fallbackQuotes.first;
  }
}