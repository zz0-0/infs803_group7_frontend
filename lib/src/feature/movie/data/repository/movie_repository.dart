import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/src/feature/movie/data/datasource/movie_data_source.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';

abstract class MovieRepository {
  Future<http.Response> createMovie(Movie data);
  Future<Movie> getMovie(int movieId);
  Future<http.Response> updateMovie(int movieId, Movie data);
  Future<http.Response> deleteMovie(int movieId);
}

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource movieDataSource;

  MovieRepositoryImpl(this.movieDataSource);

  @override
  Future<http.Response> createMovie(Movie data) async {
    return movieDataSource.createMovie(data);
  }

  @override
  Future<http.Response> deleteMovie(int movieId) async {
    return movieDataSource.deleteMovie(movieId);
  }

  @override
  Future<Movie> getMovie(int movieId) async {
    return movieDataSource.getMovie(movieId);
  }

  @override
  Future<http.Response> updateMovie(int movieId, Movie data) async {
    return movieDataSource.updateMovie(movieId, data);
  }
}
