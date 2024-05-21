import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/provider/movie_provider.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/adaptive_scaffold_appbar_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MovieEdit extends ConsumerStatefulWidget {
  final int id;

  const MovieEdit({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieEditState();
}

class _MovieEditState extends ConsumerState<MovieEdit> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final movie = ref.watch(movieStateNotifierProvider(widget.id));

    return movie.when(
      data: (Movie? data) {
        final movieNameController = TextEditingController(text: data!.names);
        final countryController = TextEditingController(text: data.country);
        final crewController = TextEditingController(text: data.crew);
        final dateController = TextEditingController(text: data.dateX);
        final genreController = TextEditingController(text: data.genre);
        final languageController = TextEditingController(text: data.origLang);
        final overviewController = TextEditingController(text: data.overview);
        final revenueController =
            TextEditingController(text: data.revenue.toString());
        final scoreController =
            TextEditingController(text: data.score.toString());

        return AdaptiveScaffoldAppbarWidget(
          title: "Movie Add",
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          controller: movieNameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Movie',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          controller: countryController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Country',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          controller: crewController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Crews',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          controller: dateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Date',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          controller: genreController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Genre',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          controller: languageController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Language',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          controller: overviewController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Overview',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          controller: revenueController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Revenue Amount',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          controller: scoreController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please Enter a Score";
                            }
                            if (int.parse(val) < 0 || int.parse(val) > 100) {
                              return "Score can only be from 0 - 100 ";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Score Count',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          data.names = movieNameController.text;
                          data.country = countryController.text;
                          data.crew = crewController.text;
                          data.dateX = dateController.text;
                          data.genre = genreController.text;
                          data.overview = overviewController.text;
                          data.revenue = double.parse(revenueController.text);
                          data.score = int.parse(scoreController.text);

                          ref
                              .read(movieRepositoryProvider)
                              .updateMovie(widget.id, data)
                              .then(
                            (value) {
                              ref.refresh(movieListDataSourceProvider);
                              context.push("/movies");
                            },
                          );
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Center(
          child: Text(
            error.toString(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.red),
          ),
        );
      },
      loading: () {
        return LoadingAnimationWidget.halfTriangleDot(
          color: Colors.deepPurple,
          size: 100,
        );
      },
    );
  }
}
