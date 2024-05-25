import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/repository/favorite_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/repository/favorite_repository.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/domain/provider/favorite_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/favorite.dart';

class FavoriteListStateNotifier
    extends StateNotifier<AsyncValue<List<Favorite>>> {
  final Ref ref;
  final int id;

  FavoriteListStateNotifier(this.ref, this.id) : super(const AsyncLoading()) {
    getFavioriteList();
  }

  Future<void> getFavioriteList() async {
    final FavoriteListRepository favoriteListRepository =
        ref.watch(favoriteListRepositoryProvider);
    final users = await favoriteListRepository.getFavoriteList(id);

    state = await AsyncValue.guard(() => Future(() => users));
  }
}

class FavoriteStateNotifier extends StateNotifier<AsyncValue<Favorite>> {
  final Ref ref;
  final int favoriteId;

  FavoriteStateNotifier(this.ref, this.favoriteId)
      : super(const AsyncLoading());

  Future<void> getFaviorite(int userId) async {
    final FavoriteRepository favoriteRepository =
        ref.watch(favoriteRepositoryProvider);
    final users = await favoriteRepository.getFavorite(userId, favoriteId);

    state = await AsyncValue.guard(() => Future(() => users));
  }

  Future<Response> deleteFavorite(int userId, Favorite favorite) async {
    final FavoriteRepository favoriteRepository =
        ref.watch(favoriteRepositoryProvider);
    return await favoriteRepository.updateFavorite(
      userId,
      favoriteId,
      favorite,
    );

    // state = await AsyncValue.guard(() => Future(() => users));
  }
}
