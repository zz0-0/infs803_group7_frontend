import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/state/favorite_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/adaptive_scaffold_appbar_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final value = ref.watch(favoriteListStateNotifierProvider);

    return value.when(
      data: (data) {
        return AdaptiveScaffoldAppbarWidget(
          title: "Favorite List",
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (data[index].deleted == false) {
                  return ListTile(
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
                    trailing: TextButton(
                      onPressed: () {
                        data[index].deleted = true;

                        ref
                            .read(favoriteStateNotifierProvider(index).notifier)
                            .deleteFavorite(data[index])
                            .then((value) {
                          if (value.statusCode == 200) {
                            ref.refresh(favoriteListStateNotifierProvider);
                            // context.push("/favorites");
                          }
                        });
                      },
                      child: const Text('Delete'),
                    ),
                    // trailing: Row(
                    //   children: [
                    //     TextButton(
                    //       child: const Text('Delete'),
                    //       onPressed: () {/* ... */},
                    //     ),
                    //   ],
                    // ),
                  );
                } else {
                  return Container();
                }
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
