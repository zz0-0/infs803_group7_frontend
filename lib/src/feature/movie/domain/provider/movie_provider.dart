import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/datasource/movie_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/datasource/movie_list_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_repository.dart';

final movieListDataSourceProvider =
    Provider((ref) => MovieListRemoteDataSource());

final movieListRepositoryProvider = Provider(
  (ref) {
    final MovieListDataSource movieDataSource =
        ref.watch(movieListDataSourceProvider);
    return MovieListRepositoryImpl(movieDataSource);
  },
);

final movieDataSourceProvider = Provider((ref) => MovieRemoteDataSource());

final movieRepositoryProvider = Provider((ref) {
  final MovieDataSource movieDataSource = ref.watch(movieDataSourceProvider);
  return MovieRepositoryImpl(movieDataSource);
});
