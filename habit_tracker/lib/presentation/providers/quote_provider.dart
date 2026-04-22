import 'package:flutter/foundation.dart';
import '../../data/datasources/api_datasource.dart';
import '../../data/models/quote_model.dart';

class QuoteProvider extends ChangeNotifier {
  final ApiDataSource _apiDataSource;
  
  Quote? _quote;
  bool _isLoading = false;

  QuoteProvider(this._apiDataSource) {
    fetchQuote();
  }

  Quote? get quote => _quote;
  bool get isLoading => _isLoading;

  Future<void> fetchQuote() async {
    _isLoading = true;
    notifyListeners();

    _quote = await _apiDataSource.fetchQuote();
    
    _isLoading = false;
    notifyListeners();
  }
}