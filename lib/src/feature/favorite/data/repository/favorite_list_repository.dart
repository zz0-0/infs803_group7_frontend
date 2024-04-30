import 'package:infs803_group7_frontend/src/feature/favorite/data/datasource/favorite_list_data_source.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';

abstract class FavoriteListRepository {
  Future<List<Movie>> getFavoriteList();
}

class FavoriteListRepositoryImpl extends FavoriteListRepository {
  final FavoriteListDataSource favoriteListDataSource;

  FavoriteListRepositoryImpl(this.favoriteListDataSource);

  @override
  Future<List<Movie>> getFavoriteList() {
    return favoriteListDataSource.getFavoriteList();
  }
}
