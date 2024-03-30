import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/main.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/model/movie.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/widget/movie_data.dart';

class MovieList extends ConsumerStatefulWidget {
  const MovieList(this.jwt, this.payload, {super.key});
  final String jwt;
  final Map<String, dynamic> payload;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieListState();

  factory MovieList.fromBase64(String jwt) => MovieList(
        jwt,
        json.decode(
          ascii.decode(base64.normalize(jwt.split(".")[1]) as List<int>),
        ) as Map<String, dynamic>,
      );
}

class _MovieListState extends ConsumerState<MovieList> {
  List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie"),
      ),
      body: FutureBuilder(
        future: fetchMovies(widget.jwt),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MovieData(data: snapshot.data!);
          }
          return Container();
        },
      ),
    );
  }

  Future<List<Movie>> fetchMovies(String jwt) async {
    final result =
        await http.get(Uri.parse(url), headers: {"Authorization": jwt});
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
