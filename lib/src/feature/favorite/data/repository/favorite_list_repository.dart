import 'package:infs803_group7_frontend/src/feature/favorite/data/datasource/favorite_list_data_source.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/favorite.dart';

abstract class FavoriteListRepository {
  Future<List<Favorite>> getFavoriteList(int userId);
}

class FavoriteListRepositoryImpl extends FavoriteListRepository {
  final FavoriteListDataSource favoriteListDataSource;

  FavoriteListRepositoryImpl(this.favoriteListDataSource);

  @override
  Future<List<Favorite>> getFavoriteList(int userId) {
    return favoriteListDataSource.getFavoriteList(userId);
  }
}
