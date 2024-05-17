import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/data/repository/favorite_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/domain/provider/favorite_provider.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/state/favorite_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_repository.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/provider/movie_provider.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieListStateNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final Ref ref;

  MovieListStateNotifier(this.ref) : super(const AsyncLoading()) {
    getMovieList();
  }

  Future<void> getMovieList() async {
    final MovieListRepository movieListRepository =
        ref.watch(movieListRepositoryProvider);
    final movies = await movieListRepository.getMovieList();
    final FavoriteListRepository favoriteListRepository =
        ref.watch(favoriteListRepositoryProvider);
    final favorites = await favoriteListRepository.getFavoriteList();

    if (favorites.isNotEmpty) {
      ref.read(favoriteIdProvider.notifier).update((state) => favorites.length);
    }
 if (movies.isNotEmpty) {
      ref.read(movieIDProvider.notifier).update((state) => movies.length);
    }
    state = await AsyncValue.guard(() => Future(() => movies));
  }
}

class MovieStateNotifier extends StateNotifier<AsyncValue<Movie>> {
  final Ref ref;
  final int id;

  MovieStateNotifier(this.ref, this.id) : super(const AsyncLoading()) {
    getMovie(id);
  }

  Future<void> getMovie(int id) async {
    final MovieRepository movieRepository = ref.watch(movieRepositoryProvider);
    final movie = await movieRepository.getMovie(id);

    state = await AsyncValue.guard(() => Future(() => movie));
  }
}
