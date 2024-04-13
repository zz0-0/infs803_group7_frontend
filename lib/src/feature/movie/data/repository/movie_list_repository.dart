import 'package:infs803_group7_frontend/src/feature/movie/data/datasource/movie_list_data_source.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';

abstract class MovieListRepository {
  Future<List<Movie>> getMovieList();
}

class MovieListRepositoryImpl extends MovieListRepository {
  final MovieListDataSource movieListDataSource;

  MovieListRepositoryImpl(this.movieListDataSource);

  @override
  Future<List<Movie>> getMovieList() {
    return movieListDataSource.getMovieList();
  }
}
