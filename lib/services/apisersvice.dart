import 'dart:convert';

import 'package:dummy_json_provider/models/quotes/quotes.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class Apisersvice {
  Future<List<Quotes1>?> fetchquotes() async {
    final baseurl = "https://dummyjson.com";
    Uri url = Uri.parse("$baseurl/quotes");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Logger().d("Quotes fetched successfully: $json");

        var resp = Quotes.fromJson(json);

        Logger().d("Parsed Quotes: ${resp.toJson()}");
        return resp.quotes;
      }
    } catch (e) {
      Logger().e("Error fetching quotes: $e");
    }
    return null;
  }
}
