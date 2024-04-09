import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/provider/movie_provider.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_list_state.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_list_state_notifier.dart';

final movieListStateNotifierProvider =
    StateNotifierProvider<MovieListStateNotifier, MovieListState>((ref) {
  final MovieListRepository movieListRepository =
      ref.watch(movieListRepositoryProvider);
  return MovieListStateNotifier(movieListRepository: movieListRepository);
});
