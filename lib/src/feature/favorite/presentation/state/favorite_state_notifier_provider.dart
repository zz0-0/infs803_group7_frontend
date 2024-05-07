import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/state/favorite_state_notifier.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/favorite.dart';

final favoriteListStateNotifierProvider = StateNotifierProvider<
    FavoriteListStateNotifier, AsyncValue<List<Favorite>>>((ref) {
  return FavoriteListStateNotifier(ref);
});

final favoriteStateNotifierProvider = StateNotifierProvider.family<
    FavoriteStateNotifier, AsyncValue<Favorite>, int>((ref, id) {
  return FavoriteStateNotifier(ref, id);
});

final favoriteIdProvider = StateProvider((ref) => 0);
