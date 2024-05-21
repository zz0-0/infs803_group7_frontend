import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/auth/domain/provider/auth_provider.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/domain/provider/favorite_provider.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/state/favorite_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/provider/movie_provider.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/favorite.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/adaptive_scaffold_appbar_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MovieList extends ConsumerStatefulWidget {
  const MovieList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends ConsumerState<MovieList> {
  @override
  Widget build(BuildContext context) {
    final value = ref.watch(movieListStateNotifierProvider);
    final id = ref.watch(favoriteIdProvider);
    // return Container();
    Widget? floating;
    if (ref.watch(adminProvider) == true) {
      floating = FloatingActionButton(
        onPressed: () {
          context.pushNamed(
            "movie_add",
          );
        },
        child: const Icon(Icons.add),
      );
    }

    return value.when(
      skipLoadingOnReload: false,
      data: (data) {
        return AdaptiveScaffoldAppbarWidget(
          title: "Movie List",
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio:
                    ref.watch(adminProvider) == true ? (3 / 3) : (3 / 2.5),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(
                        "movie_info",
                        pathParameters: {"movieId": index.toString()},
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              data[index].names![0],
                            ),
                          ),
                          title: Text(
                            data[index].names!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            "Rating: ${data[index].score!}",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (ref.watch(adminProvider) == true)
                          ElevatedButton(
                            onPressed: () {
                              context.pushNamed(
                                "movie_edit",
                                pathParameters: {"movieId": index.toString()},
                              );
                            },
                            child: const Text('Modify'),
                          ),
                        if (ref.watch(adminProvider) == true)
                          ElevatedButton(
                            onPressed: () {
                              data[index].deleted = true;
                              ref
                                  .read(movieRepositoryProvider)
                                  .updateMovie(index, data[index]);
                            },
                            child: const Text('Delete'),
                          ),
                        if (ref.watch(adminProvider) == false)
                          TextButton(
                            child: const Text('Add to favorites'),
                            onPressed: () {
                              final favorite = Favorite(
                                budgetX: data[index].budgetX,
                                country: data[index].country,
                                crew: data[index].crew,
                                dateX: data[index].dateX,
                                genre: data[index].genre,
                                names: data[index].names,
                                origLang: data[index].origLang,
                                origTitle: data[index].origTitle,
                                overview: data[index].overview,
                                revenue: data[index].revenue,
                                score: data[index].score,
                                status: data[index].status,
                                deleted: false,
                              );

                              ref
                                  .read(favoriteRepositoryProvider)
                                  .createFavorite(id, favorite);
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: floating,
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
