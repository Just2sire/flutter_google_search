import 'dart:convert';

import 'package:google_search_app/config/api_json.dart';
import 'package:google_search_app/config/api_keys.dart';
import 'package:http/http.dart' as http;

class ApiService {
  bool isDummyData = true;

  Future<Map<String, dynamic>> fetchData(
      {required String queryTerm, String start = "0"}) async {
    try {
      if (!isDummyData) {
        String q = queryTerm.contains(" ")
            ? queryTerm.split(" ").join("%20")
            : queryTerm;

        final response = await http.get(Uri.parse(
              'https://www.googleapis.com/customsearch/v1?key=$apiKey&cx=$contextKey&q=$q&start=$start'),
        );

        if (response.statusCode == 200) {
          final jsonData = response.body;
          final respData = jsonDecode(jsonData);
          return respData;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return apiResponse;
    // return Future.delayed(Duration(seconds: 2,), () => apiResponse);
  }
}
