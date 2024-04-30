import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/state/favorite_state_notifier_provider.dart';
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
        return Scaffold(
          appBar: AppBar(
            title: const Text("Movie List"),
          ),
          body: ListView.builder(
              scrollDirection: Axis.horizontal,
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
              }),
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
