import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_repository.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/model/movie.dart';

class MovieListStateNotifier extends StateNotifier<AsyncValue<void>> {
  final MovieListRepository movieListRepository;

  MovieListStateNotifier({required this.movieListRepository})
      : super(const AsyncValue.data(null));

  Future<List<Movie>> getMovieList() async {
    final List<Movie> response = await movieListRepository.getMovieList();

    // try {
    //   state = const AsyncValue.loading();
    //   response = await movieListRepository.getMovieList();
    // } catch (e) {
    //   // state = const AsyncError("error", e);
    // } finally {
    //   state = const AsyncValue.data(null);
    // }

    return response;
  }
}

class MovieStateNotifier extends StateNotifier<AsyncValue<void>> {
  final MovieRepository movieRepository;

  MovieStateNotifier({required this.movieRepository})
      : super(const AsyncValue.data(null));
}
