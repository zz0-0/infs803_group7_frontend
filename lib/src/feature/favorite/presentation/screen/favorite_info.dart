import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/state/favorite_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/favorite.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/adaptive_scaffold_appbar_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FavoriteInfo extends ConsumerStatefulWidget {
  final int id;

  const FavoriteInfo({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteInfoState();
}

class _FavoriteInfoState extends ConsumerState<FavoriteInfo> {
  @override
  Widget build(BuildContext context) {
    final favorite = ref.watch(favoriteStateNotifierProvider(widget.id));

    return favorite.when(
      data: (Favorite? data) {
        return AdaptiveScaffoldAppbarWidget(
          title: "Favorite Info",
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      child: Text(
                        data!.names![0],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      data.names!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Country: ${data.country!}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Crew: ${data.crew!}",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Date: ${data.dateX!}",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Genre: ${data.genre!}",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Language: ${data.origLang!}",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Overview: ${data.overview!}",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Revenue: ${data.revenue!}",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Score: ${data.score!}",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Status: ${data.status!}",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
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
