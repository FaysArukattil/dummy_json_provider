import 'package:dummy_json_provider/models/quotes/quotes.dart';
import 'package:dummy_json_provider/services/apisersvice.dart';
import 'package:flutter/widgets.dart';

class Quotescontroller with ChangeNotifier {
  List<Quotes1>? quotelist = [];
  Apisersvice apiservice = Apisersvice();

  bool isLoading = false;
  void toggle() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchquotes() async {
    toggle();
    quotelist = await apiservice.fetchquotes();
    toggle();
  }
}
