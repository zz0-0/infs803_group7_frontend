import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_repository.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/provider/movie_provider.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_state_notifier.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';

final movieListStateNotifierProvider =
    StateNotifierProvider<MovieListStateNotifier, AsyncValue<List<Movie>>>(
        (ref) {
  return MovieListStateNotifier(ref);
});

// final movieListStateNotifierProvider =
//     StateNotifierProvider<MovieListStateNotifier, AsyncValue>((ref) {
//   final MovieListRepository movieListRepository =
//       ref.watch(movieListRepositoryProvider);
//   return MovieListStateNotifier(movieListRepository: movieListRepository);
// });

final movieStateNotifierProvider =
    StateNotifierProvider.family<MovieStateNotifier, AsyncValue<Movie>, int>(
        (ref, id) {
  return MovieStateNotifier(ref, id);
});

// final movieListStreamProvider = StreamProvider((ref) {
//   final MovieListRepository movieListRepository =
//       ref.watch(movieListRepositoryProvider);
//   return Stream.fromFuture(movieListRepository.getMovieList());
// });

// final movieDeleteStreamProvider =
//     StreamProviderFamily<Response, int>((ref, id) {
//   final MovieRepository movieRepository = ref.watch(movieRepositoryProvider);
//   return Stream.fromFuture(movieRepository.deleteMovie(id));
// });
