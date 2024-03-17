import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieList extends ConsumerStatefulWidget {
  const MovieList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends ConsumerState<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [],
      ),
    );
  }
}
