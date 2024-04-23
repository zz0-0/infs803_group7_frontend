// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_state_notifier_provider.dart';
// import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';

// class FavoriteScreen extends ConsumerStatefulWidget {
//   const FavoriteScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: ref.read(movieListStateNotifierProvider.notifier).getMovieList(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final List<Movie> movies = snapshot.data!;
//           return ListView.builder(
//             itemCount: movies.length,
//             itemBuilder: (BuildContext context, int index) {
//               final movie = movies[index];
//               return ListTile(
//                 // leading: CircleAvatar(
//                 //   child: Text(
//                 //     user.name[0],
//                 //   ), // Display first letter of user's name
//                 // ),
//                 title: Text(movie.name),
//               );
//             },
//           );
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
// }
