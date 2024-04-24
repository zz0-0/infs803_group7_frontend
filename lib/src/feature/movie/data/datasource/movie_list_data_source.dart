import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/global.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';

abstract class MovieListDataSource {
  Future<List<Movie>> getMovieList();
}

class MovieListRemoteDataSource implements MovieListDataSource {
  @override
  Future<List<Movie>> getMovieList() async {
    final result = await http.get(
      Uri.parse("$url/movies"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
    );
    final List<Movie> movies = [];
    if (result.statusCode == 200) {
      final data = json.decode(result.body) as Map<String, dynamic>;
      final List dataList = data["movies"] as List;
      return dataList
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (result.statusCode == 401) {
      await tokenManager.refreshToken();
      await getMovieList();
      return [];
    }
    return movies;
  }
}
