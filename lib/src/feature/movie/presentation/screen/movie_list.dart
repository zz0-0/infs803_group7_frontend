import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/domain/provider/favorite_provider.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/state/favorite_state_notifier_provider.dart';
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
    return value.when(
      skipLoadingOnReload: false,
      data: (data) {
        return AdaptiveScaffoldAppbarWidget(
          title: "Movie List",
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(
                        "movie",
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
