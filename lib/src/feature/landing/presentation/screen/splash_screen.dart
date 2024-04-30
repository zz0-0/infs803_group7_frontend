import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/global.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  var token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirect();
  }

  Future<void> redirect() async {
    await Future.delayed(Duration.zero);

    token = await tokenManager.token;

    // session
    // token
    //     .get()
    //     .then(
    //       (value) => {
    //         {context.go("/users")},
    //       },
    //     )
    //     .onError(
    //       (error, stackTrace) => {
    //         {context.go("/login")},
    //       },
    //     );
    if (token != null) {
      context.go("/users");
    } else {
      context.go("/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      useImmersiveMode: true,
      gifPath: 'assets/loading.gif',
      gifWidth: 269,
      gifHeight: 474,
      duration: const Duration(milliseconds: 3515),
    );
  }
}