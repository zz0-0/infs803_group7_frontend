import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_repository.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/model/movie.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_state.dart';

class MovieListStateNotifier extends StateNotifier<MovieListState> {
  final MovieListRepository movieListRepository;

  MovieListStateNotifier({required this.movieListRepository})
      : super(MovieListInitial());

  Future<List<Movie>> getMovieList() async {
    state = MovieListLoading();
    final response = await movieListRepository.getMovieList();

    if (response != "") {
      state = MovieListSuccess();
    } else {
      state = MovieListFailure();
    }

    return response;
  }
}

class MovieStateNotifier extends StateNotifier<MovieState> {
  final MovieRepository movieRepository;

  MovieStateNotifier({required this.movieRepository}) : super(MovieInitial());

  // Future<Movie> getMovie() async {
  //   state = MovieLoading();
  //   final response = await movieRepository.getMovie();

  //   if (response != "") {
  //     state = MovieSuccess();
  //   } else {
  //     state = MovieFailure();
  //   }

  //   return response;
  // }

  // Future<void> createMovie() async {
  //   state = MovieLoading();
  //   movieRepository.createMovie();
  // }

  // Future<void> updateMovie() async {
  //   state = MovieLoading();
  //   movieRepository.updateMovie();
  // }

  // Future<void> deleteMovie() async {
  //   state = MovieLoading();
  //   movieRepository.deleteMovie();
  // }
}
