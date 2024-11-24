import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;

class StackService {
  final String apiUrl = 'https://api.mocklets.com/p6764/test_mint';

  Future<List<dynamic>> fetchStack() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['items'];
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      print('Error fetching data from API: $e');
      throw Exception('Error fetching data from API');
    }
  }

  Future<List<dynamic>> fetchStackData() async {
    try {
      final String response =
          await rootBundle.rootBundle.loadString('assets/mock_json.json');
      final data = json.decode(response);
      return data['items'];
    } catch (e) {
      print('Error loading local JSON: $e');
      throw Exception('Error loading local JSON');
    }
  }
}
