import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/datasource/movie_list_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/movie/data/repository/movie_list_repository.dart';

final movieListDataSourceProvider =
    Provider((ref) => MovieListRemoteDataSource());

final movieListRepositoryProvider = Provider(
  (ref) {
    final MovieListDataSource movieDataSource =
        ref.watch(movieListDataSourceProvider);
    return MovieListRepositoryImpl(movieDataSource);
  },
);
