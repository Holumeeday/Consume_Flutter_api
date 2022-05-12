

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/userPost.dart';

Future<Post> getPosts() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    final posts = Post.fromJson(jsonDecode(response.body));
    return posts;
  } else {
    throw Exception('Failed to load posts');
  }
}