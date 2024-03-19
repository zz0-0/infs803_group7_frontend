import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/src/feature/movie/domain/model/movie.dart';

class MovieList extends ConsumerStatefulWidget {
  const MovieList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends ConsumerState<MovieList> {
  String url = "https://abc.com/api/movies/";
  List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [],
      ),
    );
  }

  Future<http.Response> fetchUsers() async {
    final result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      final data = jsonDecode(result.body);
      data['movie'].forEach(
        (value) => movies
            .add(Movie(id: value["id"] as int, name: value["name"] as String)),
      );
    }
    return result;
  }
}
