import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/screen/login_screen.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/screen/register_screen.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/screen/movie_info.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/screen/movie_list.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_add.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_info.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_list.dart';

// import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_login.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      // builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/movies',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const MovieList(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      // builder: (context, state) => const MovieList(),
    ),
    GoRoute(
      path: '/movie/:movieId',
      name: "movie",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: MovieInfo(
            id: int.parse(state.pathParameters['movieId']!),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      // builder: (context, state) => MovieInfo(
      //   id: int.parse(state.pathParameters['movieId']!),
      // ),
    ),
    GoRoute(
      path: '/users',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const UserList(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      // builder: (context, state) => const UserList(),
    ),
    GoRoute(
      path: '/user/:userId',
      name: "user",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: UserInfo(
            id: int.parse(state.pathParameters['userId']!),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      // builder: (context, state) => UserInfo(
      //   id: int.parse(state.pathParameters['userId']!),
      // ),
    ),
    GoRoute(
      path: '/user_add',
      name: "user_add",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const UserAdd(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      // builder: (context, state) => UserInfo(
      //   id: int.parse(state.pathParameters['userId']!),
      // ),
    ),
    // GoRoute(
    //   path: '/favorite/:userId',
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: const FavoriteScreen(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity:
    //               CurveTween(curve: Curves.easeInOutCirc).animate(animation),
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    //   // builder: (context, state) => const FavoriteScreen(),
    // ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      // builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const RegisterScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      // builder: (context, state) => const RegisterScreen(),
    ),
  ],
  // redirect: (context, state) {
  //   if (AuthState.of(context).isSignedIn) {
  //     return '/signin';
  //   } else {
  //     return null;
  //   }
  // },
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
