import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/state/favorite_state_notifier.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/favorite.dart';

final favoriteListStateNotifierProvider = StateNotifierProvider.family<
    FavoriteListStateNotifier, AsyncValue<List<Favorite>>, int>((ref, id) {
  return FavoriteListStateNotifier(ref, id);
});

final favoriteStateNotifierProvider = StateNotifierProvider.family<
    FavoriteStateNotifier, AsyncValue<Favorite>, int>((ref, favoriteId) {
  return FavoriteStateNotifier(ref, favoriteId);
});

final favoriteIdProvider = StateProvider((ref) => 0);
