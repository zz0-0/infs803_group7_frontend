import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';

class MovieList extends ConsumerStatefulWidget {
  const MovieList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends ConsumerState<MovieList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.read(movieListStateNotifierProvider.notifier).getMovieList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Movie> movies = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              mainAxisSpacing: 8.0, // Vertical spacing between items
              crossAxisSpacing: 8.0, // Horizontal spacing between items
            ),
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  // Handle movie tap (e.g., navigate to movie details)
                },
                child: Card(
                  elevation: 4.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Movie poster or image here (you can use Image.network or Image.asset)
                      Text(
                        movie.name,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
