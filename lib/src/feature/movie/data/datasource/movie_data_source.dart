import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/global.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';
import 'package:infs803_group7_frontend/src/share/token/domain/model/token_manager.dart';

abstract class MovieDataSource {
  Future<http.Response> createMovie(Movie data);
  Future<Movie> getMovie(int movieId);
  Future<http.Response> updateMovie(int movieId, Movie data);
  Future<http.Response> deleteMovie(int movieId);
}

class MovieRemoteDataSource implements MovieDataSource {
  @override
  Future<http.Response> createMovie(Movie data) async {
    final token = await tokenManager.token;

    return http.post(
      Uri.parse("$url/movies"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
      body: json.encode(data),
    );
  }

  @override
  Future<http.Response> deleteMovie(int movieId) async {
    final token = await tokenManager.token;

    return http.delete(
      Uri.parse("$url/movies/$movieId"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
    );
  }

  @override
  Future<Movie> getMovie(int movieId) async {
    final token = await tokenManager.token;

    late Movie movie;
    final result = await http.get(
      Uri.parse("$url/movies/$movieId"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
    );

    if (result.statusCode == 200) {
      final data = json.decode(result.body) as Map<String, dynamic>;
      movie = Movie.fromJson(data);
    } else if (result.statusCode == 401) {
      final response = await TokenManager().refreshToken();
      if (response!.statusCode == 200) {
        getMovie(movieId);
      }
    }
    return movie;
  }

  @override
  Future<http.Response> updateMovie(int movieId, Movie data) async {
    final token = await tokenManager.token;

    return http.post(
      Uri.parse("$url/movies/$movieId"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(data),
    );
  }
}
