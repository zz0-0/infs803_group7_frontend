import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/datasource/favorite_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/datasource/favorite_list_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/repository/favorite_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/repository/favorite_repository.dart';

final favoriteListDataSourceProvider =
    Provider((ref) => FavoriteListRemoteDataSource());

final favoriteListRepositoryProvider = Provider(
  (ref) {
    final FavoriteListDataSource favoriteDataSource =
        ref.watch(favoriteListDataSourceProvider);
    return FavoriteListRepositoryImpl(favoriteDataSource);
  },
);

final favoriteDataSourceProvider =
    Provider((ref) => FavoriteRemoteDataSource());

final favoriteRepositoryProvider = Provider((ref) {
  final FavoriteDataSource favoriteDataSource =
      ref.watch(favoriteDataSourceProvider);
  return FavoriteRepositoryImpl(favoriteDataSource);
});
