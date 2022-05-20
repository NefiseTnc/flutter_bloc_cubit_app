import 'dart:convert';

import 'package:flutter_cubit_app/post.dart';
import 'package:http/http.dart' as http;

class DataService {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    try {
      final uri = Uri.parse('$_baseUrl/posts');
      final response = await http.get(uri);
      final json = jsonDecode(response.body) as List;
      final posts = json.map((postJson) => Post.fromMap(postJson)).toList();
      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
