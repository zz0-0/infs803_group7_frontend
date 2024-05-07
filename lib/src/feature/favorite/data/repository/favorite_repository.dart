import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/src/feature/favorite/data/datasource/favorite_data_source.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/favorite.dart';

abstract class FavoriteRepository {
  Future<http.Response> createFavorite(int favoriteId, Favorite data);
  Future<Favorite> getFavorite(int favoriteId);
  Future<http.Response> updateFavorite(int favoriteId, Favorite data);
  Future<http.Response> deleteFavorite(int favoriteId);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDataSource favoriteDataSource;

  FavoriteRepositoryImpl(this.favoriteDataSource);

  @override
  Future<http.Response> createFavorite(int favoriteId, Favorite data) async {
    return favoriteDataSource.createFavorite(favoriteId, data);
  }

  @override
  Future<http.Response> deleteFavorite(int favoriteId) async {
    return favoriteDataSource.deleteFavorite(favoriteId);
  }

  @override
  Future<Favorite> getFavorite(int favoriteId) async {
    return favoriteDataSource.getFavorite(favoriteId);
  }

  @override
  Future<http.Response> updateFavorite(int favoriteId, Favorite data) async {
    return favoriteDataSource.updateFavorite(favoriteId, data);
  }
}
