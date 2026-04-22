import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote_model.dart';

class ApiDataSource {
  static const String _quotesUrl = 'https://api.quotable.io/random';

  Future<Quote> fetchQuote() async {
    try {
      final response = await http.get(Uri.parse(_quotesUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Quote.fromMap(data);
      }
    } catch (e) {
      // Return fallback quote on error
    }
    return Quote.fromMap({
      'content': 'The secret of getting ahead is getting started.',
      'author': 'Mark Twain',
    });
  }
}