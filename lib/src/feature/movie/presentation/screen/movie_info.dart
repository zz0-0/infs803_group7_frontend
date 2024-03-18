import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

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

  Future<http.Response> createMovie() {
    return http.post(Uri.parse("https://abc.com/movie/1"));
  }

  Future<http.Response> fetchMovie() {
    return http.get(Uri.parse("https://abc.com/movie/1"));
  }

  Future<http.Response> updateMovie() {
    return http.post(Uri.parse("https://abc.com/movie/1"));
  }

  Future<http.Response> deleteMovie() {
    return http.delete(Uri.parse("https://abc.com/movie/1"));
  }
}
