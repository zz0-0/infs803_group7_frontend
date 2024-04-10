import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  // Future<http.Response> createMovie(Movie data) {
  //   return http.post(
  //     Uri.parse("$url/movie"),
  //     body: data,
  //   );
  // }

  // Future<http.Response> fetchMovie(int movieId) {
  //   return http.get(
  //     Uri.parse("$url/movie/$movieId"),
  //   );
  // }

  // Future<http.Response> updateMovie(int movieId, Movie data) {
  //   return http.post(
  //     Uri.parse("$url/movie/$movieId"),
  //     body: data,
  //   );
  // }

  // Future<http.Response> deleteMovie(int movieId) {
  //   return http.delete(
  //     Uri.parse("$url/movie/$movieId"),
  //   );
  // }
}
