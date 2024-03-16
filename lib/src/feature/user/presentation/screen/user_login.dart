import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/widget/login.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/widget/signup.dart';

class UserLogin extends ConsumerStatefulWidget {
  const UserLogin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserLoginState();
}

class _UserLoginState extends ConsumerState<UserLogin>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Login",
            ),
            Tab(
              text: "Sign Up",
            ),
          ],
        ),
      ),
      body: Expanded(
        child: TabBarView(
          controller: _tabController,
          children: const [
            Login(),
            SignUp(),
          ],
        ),
      ),
    );
  }
}
