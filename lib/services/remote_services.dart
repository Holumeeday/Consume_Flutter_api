import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/userPost.dart';

class GetApiData {
  static getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      // decode the json response
      final posts = jsonDecode(response.body);
      // return decoded data
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
