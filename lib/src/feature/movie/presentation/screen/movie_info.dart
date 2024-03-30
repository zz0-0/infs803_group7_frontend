import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/main.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/model/movie.dart';

class MovieInfo extends ConsumerStatefulWidget {
  const MovieInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieInfoState();
}

class _MovieInfoState extends ConsumerState<MovieInfo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<http.Response> createMovie(Movie data) {
    return http.post(Uri.parse(url), body: data);
  }

  Future<http.Response> fetchMovie(int movieId) {
    return http.get(Uri.parse("$url$movieId"));
  }

  Future<http.Response> updateMovie(int movieId, Movie data) {
    return http.post(Uri.parse("$url$movieId"), body: data);
  }

  Future<http.Response> deleteMovie(int movieId) {
    return http.delete(Uri.parse("$url$movieId"));
  }
}
