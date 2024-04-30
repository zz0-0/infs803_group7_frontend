import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/datasource/favorite_list_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/repository/favorite_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/state/favorite_state_notifier.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';

final favoriteListDataSourceProvider =
    Provider((ref) => FavoriteListRemoteDataSource());

final favoriteListRepositoryProvider = Provider(
  (ref) {
    final FavoriteListDataSource favoriteDataSource =
        ref.watch(favoriteListDataSourceProvider);
    return FavoriteListRepositoryImpl(favoriteDataSource);
  },
);

final favoriteListStateNotifierProvider =
    StateNotifierProvider<FavoriteListStateNotifier, AsyncValue<List<Movie>>>(
        (ref) {
  return FavoriteListStateNotifier(ref);
});
