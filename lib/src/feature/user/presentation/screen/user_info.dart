import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UserInfo extends ConsumerStatefulWidget {
  final int id;

  const UserInfo({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserInfoState();
}

class _UserInfoState extends ConsumerState<UserInfo> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userGetStreamProvider(widget.id));
    return user.when(
      data: (User data) {
        return Material(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: data.name,
                  ),
                  TextFormField(
                    initialValue: data.username,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Processing Data')),
                        // );
                        setState(() {
                          ref.watch(userModifyStreamProvider(data));
                          context.go("/users");
                        });
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
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
                .headline6!
                .copyWith(color: Colors.red),
          ),
        );
      },
      loading: () {
        return LoadingAnimationWidget.halfTriangleDot(
          color: Colors.white,
          size: 30,
        );
      },
    );
    // return Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: Form(
    //     key: _formKey,
    //     child: Column(
    //       children: [
    //         TextFormField(),
    //         ElevatedButton(
    //           onPressed: () {
    //             // Validate returns true if the form is valid, or false otherwise.
    //             if (_formKey.currentState!.validate()) {
    //               // If the form is valid, display a snackbar. In the real world,
    //               // you'd often call a server or save the information in a database.
    //               ScaffoldMessenger.of(context).showSnackBar(
    //                 const SnackBar(content: Text('Processing Data')),
    //               );
    //               setState(() {
    //                 ref.watch(userModifyStreamProvider());
    //               });
    //             }
    //           },
    //           child: const Text('Submit'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
