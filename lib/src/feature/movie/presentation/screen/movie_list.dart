import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/model/movie.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_list_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/widget/movie_data.dart';

class MovieList extends ConsumerStatefulWidget {
  const MovieList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends ConsumerState<MovieList> {
  List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie"),
      ),
      body: FutureBuilder(
        future:
            ref.read(movieListStateNotifierProvider.notifier).getMovieList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MovieData(data: snapshot.data!);
          }
          return Container();
        },
      ),
    );
  }
}
