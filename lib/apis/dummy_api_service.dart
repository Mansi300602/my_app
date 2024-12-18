import 'package:http/http.dart 'as http;
import 'dart:convert';

import 'package:myy_app/apis/api_model.dart';
class ApiService {
  // API Endpoint URL
  final String _url =
      'https://raw.githubusercontent.com/TheAppWizard/DummyData/refs/heads/main/dummy-api.json';

  /// Fetches data from the API
  Future<DummyModel> fetchData() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        // Parse JSON response
        final DummyModel dummyModel = dummyModelFromJson(response.body);
        return dummyModel;
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}