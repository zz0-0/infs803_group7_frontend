import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAdd extends ConsumerStatefulWidget {
  const UserAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserAddState();
}

class _UserAddState extends ConsumerState<UserAdd> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(),
          TextFormField(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              // await ref.read(userStateNotifierProvider.notifier).create();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
