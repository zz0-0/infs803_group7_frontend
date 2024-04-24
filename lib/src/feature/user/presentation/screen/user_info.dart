import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/provider/user_provider.dart';
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
    final user = ref.watch(userStateNotifierProvider(widget.id));

    return user.when(
      data: (User? data) {
        final nameController = TextEditingController(text: data!.name);
        final usernameController = TextEditingController(text: data.username);

        return Material(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      // initialValue: data!.name,
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      // initialValue: data.username,
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      data.name = nameController.text;
                      data.username = usernameController.text;
                      ref
                          .read(userRepositoryProvider)
                          .updateUser(widget.id, data)
                          .then(
                        (value) {
                          ref.refresh(userListStateNotifierProvider);
                          context.go("/users");
                        },
                      );

                      // final message = ref.watch(userModifyStreamProvider(data));

                      // message.when(
                      //   data: (Response response) {
                      //     if (response.statusCode == 200) {
                      //       final snackBar = SnackBar(
                      //         content: const Text('Update success'),
                      //         backgroundColor: Colors.black12,
                      //         action: SnackBarAction(
                      //           label: 'dismiss',
                      //           onPressed: () {
                      //             context.go("/users");
                      //           },
                      //         ),
                      //       );
                      //       ScaffoldMessenger.of(context)
                      //           .showSnackBar(snackBar);
                      //     }
                      //   },
                      //   error: (Object error, StackTrace stackTrace) {
                      //     return Center(
                      //       child: Text(
                      //         error.toString(),
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .titleLarge!
                      //             .copyWith(color: Colors.red),
                      //       ),
                      //     );
                      //   },
                      //   loading: () {
                      //     setState(() {
                      //       isLoading = true;
                      //     });

                      //     return LoadingAnimationWidget.halfTriangleDot(
                      //       color: Colors.deepPurple,
                      //       size: 20,
                      //     );
                      //   },
                      // );
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
