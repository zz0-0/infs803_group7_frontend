import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/global.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';
import 'package:infs803_group7_frontend/src/share/token/domain/model/token_manager.dart';

abstract class MovieListDataSource {
  Future<List<Movie>> getMovieList();
}

class MovieListRemoteDataSource implements MovieListDataSource {
  @override
  Future<List<Movie>> getMovieList() async {
    final token = await tokenManager.token;

    final result = await http.get(
      Uri.parse("$url/movies"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final List<Movie> movie = [];

    if (result.statusCode == 200) {
      final data = json.decode(result.body) as Map<String, dynamic>;
      final List dataList = data["movies"] as List;

      return dataList
          .map((e) {
            final u = Movie.fromJson(e as Map<String, dynamic>);
            return u;
          })
          .where((e) => e.deleted != true)
          .toList();
    } else if (result.statusCode == 401) {
      final response = await TokenManager().refreshToken();
      if (response!.statusCode == 200) {
        getMovieList();
      }
    }
    return movie;
  }
}
