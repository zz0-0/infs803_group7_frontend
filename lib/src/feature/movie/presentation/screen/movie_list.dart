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
  String url = "https://127.0.0.1:3000/api/movies/";
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

  Future<List<Movie>> fetchMovies() async {
    final result = await http.get(Uri.parse(url));
    final List<Movie> movies = [];
    if (result.statusCode == 200) {
      final data = json.decode(result.body);
      final List dataList = data["movies"] as List;
      return dataList
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return movies;
  }
}
