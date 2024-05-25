import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/global.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/favorite.dart';

abstract class FavoriteDataSource {
  Future<http.Response> createFavorite(
    int userId,
    int favoriteId,
    Favorite data,
  );
  Future<Favorite> getFavorite(int userId, int favoriteId);
  Future<http.Response> updateFavorite(
    int userId,
    int favoriteId,
    Favorite data,
  );
  Future<http.Response> deleteFavorite(int userId, int favoriteId);
}

class FavoriteRemoteDataSource implements FavoriteDataSource {
  @override
  Future<http.Response> createFavorite(
    int userId,
    int favoriteId,
    Favorite data,
  ) async {
    final token = await tokenManager.token;

    return http.post(
      Uri.parse("$url/favorites/$userId/$favoriteId"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
      body: json.encode(data),
    );
  }

  @override
  Future<http.Response> deleteFavorite(int userId, int favoriteId) async {
    final token = await tokenManager.token;

    return http.delete(
      Uri.parse("$url/favorites/$userId/$favoriteId"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
    );
  }

  @override
  Future<Favorite> getFavorite(int userId, int favoriteId) async {
    final token = await tokenManager.token;

    late Favorite favorite;
    final result = await http.get(
      Uri.parse("$url/favorites/$userId/$favoriteId"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
    );

    if (result.statusCode == 200) {
      final data = json.decode(result.body) as Map<String, dynamic>;
      favorite = Favorite.fromJson(data);
    } else if (result.statusCode == 401) {}
    return favorite;
  }

  @override
  Future<http.Response> updateFavorite(
    int userId,
    int favoriteId,
    Favorite data,
  ) async {
    final token = await tokenManager.token;

    return http.patch(
      Uri.parse("$url/favorites/$userId/$favoriteId"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(data),
    );
  }
}
