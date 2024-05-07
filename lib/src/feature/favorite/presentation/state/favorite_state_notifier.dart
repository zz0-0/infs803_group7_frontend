import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/repository/favorite_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/repository/favorite_repository.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/domain/provider/favorite_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/favorite.dart';

class FavoriteListStateNotifier
    extends StateNotifier<AsyncValue<List<Favorite>>> {
  final Ref ref;

  FavoriteListStateNotifier(this.ref) : super(const AsyncLoading()) {
    getFavioriteList();
  }

  Future<void> getFavioriteList() async {
    final FavoriteListRepository favoriteListRepository =
        ref.watch(favoriteListRepositoryProvider);
    final users = await favoriteListRepository.getFavoriteList();

    state = await AsyncValue.guard(() => Future(() => users));
  }
}

class FavoriteStateNotifier extends StateNotifier<AsyncValue<Favorite>> {
  final Ref ref;
  final int id;

  FavoriteStateNotifier(this.ref, this.id) : super(const AsyncLoading());

  Future<void> getFaviorite() async {
    final FavoriteRepository favoriteRepository =
        ref.watch(favoriteRepositoryProvider);
    final users = await favoriteRepository.getFavorite(id);

    state = await AsyncValue.guard(() => Future(() => users));
  }

  Future<Response> deleteFavorite(Favorite favorite) async {
    final FavoriteRepository favoriteRepository =
        ref.watch(favoriteRepositoryProvider);
    return await favoriteRepository.updateFavorite(id, favorite);

    // state = await AsyncValue.guard(() => Future(() => users));
  }
}
