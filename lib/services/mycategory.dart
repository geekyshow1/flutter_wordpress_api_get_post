import 'dart:convert';

import 'package:http/http.dart' as http;

class MyCategory {
  String baseUrl =
      "http://elearningcave.com/wp-json/wp/v2/posts?_embed&categories=2";
  Future<List> getCategoryPost() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      print(response);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (SocketException) {
      return Future.error("Error Fetching Data");
    }
  }
}
