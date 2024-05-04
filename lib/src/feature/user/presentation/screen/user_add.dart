import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/provider/user_provider.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/adaptive_scaffold_widget.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/logout_widget.dart';

class UserAdd extends ConsumerStatefulWidget {
  const UserAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserAddState();
}

class _UserAddState extends ConsumerState<UserAdd> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final levelController = TextEditingController();
  User user = User(
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    return Container();
    // return AdaptiveScaffoldWidget(
    //   title: "User Add",
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Form(
    //       key: _formKey,
    //       child: Column(
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.all(10),
    //             child: TextFormField(
    //               // initialValue: data.name,
    //               controller: nameController,
    //               decoration: const InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 labelText: 'Name',
    //               ),
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.all(10),
    //             child: TextFormField(
    //               controller: usernameController,
    //               decoration: const InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 labelText: 'Username',
    //               ),
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.all(10),
    //             child: TextFormField(
    //               obscureText: true,
    //               controller: passwordController,
    //               decoration: const InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 labelText: 'Password',
    //               ),
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.all(10),
    //             child: TextFormField(
    //               controller: levelController,
    //               validator: (val) {
    //                 if (int.parse(val!) > 3) {
    //                   return "Level can only be from 1 to 3";
    //                 }
    //                 return null;
    //               },
    //               decoration: const InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 labelText: 'level',
    //               ),
    //             ),
    //           ),
    //           const SizedBox(height: 16),
    //           ElevatedButton(
    //             onPressed: () {
    //               user.id = ref.read(userIdProvider) + 1;
    //               user.deleted = false;
    //               user.createdAt = DateTime.now();
    //               user.updatedAt = DateTime.now();
    //               user.name = nameController.text;
    //               user.username = usernameController.text;
    //               user.password = passwordController.text;
    //               user.level = int.parse(levelController.text);

    //               ref
    //                   .read(userRepositoryProvider)
    //                   .updateUser(user.id - 1, user)
    //                   .then(
    //                 (value) {
    //                   ref.refresh(userListStateNotifierProvider);
    //                   context.push("/users");
    //                 },
    //               );
    //             },
    //             child: const Text('Submit'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
