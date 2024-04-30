import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/repository/favorite_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/state/favorite_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';

class FavoriteListStateNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
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
