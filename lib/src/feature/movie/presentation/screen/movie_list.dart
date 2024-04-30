import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_state_notifier_provider.dart';
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
    return value.when(
      skipLoadingOnReload: false,
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Movie List"),
          ),
          body: GridView.builder(
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
                  onTap: () {},
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
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ),
              );
            },
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
