import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/screen/login_screen.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/screen/register_screen.dart';
import 'package:infs803_group7_frontend/src/feature/favorite/presentation/screen/favorite_screen.dart';
import 'package:infs803_group7_frontend/src/feature/landing/presentation/screen/splash_screen.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/screen/movie_info.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/screen/movie_list.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_add.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_info.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_list.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/adaptive_scaffold_widget.dart';
import 'package:infs803_group7_frontend/src/share/theme/theme_provider.dart';
import 'package:layout/layout.dart';

// import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_login.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _movieNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _userNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _favoriteNavigatorKey =
    GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: "/",
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
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
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return AdaptiveScaffoldWidget(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _movieNavigatorKey,
          routes: [
            GoRoute(
              path: '/movies',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const MovieList(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
              // routes: [
              //   GoRoute(
              //     path: ':movieId',
              //     name: "movie",
              //     pageBuilder: (context, state) {
              //       return CustomTransitionPage(
              //         key: state.pageKey,
              //         child: MovieInfo(
              //           id: int.parse(state.pathParameters['movieId']!),
              //         ),
              //         transitionsBuilder:
              //             (context, animation, secondaryAnimation, child) {
              //           return FadeTransition(
              //             opacity: CurveTween(curve: Curves.easeInOutCirc)
              //                 .animate(animation),
              //             child: child,
              //           );
              //         },
              //       );
              //     },
              //     // builder: (context, state) => MovieInfo(
              //     //   id: int.parse(state.pathParameters['movieId']!),
              //     // ),
              //   ),
              // ],
              // builder: (context, state) => const MovieList(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _userNavigatorKey,
          routes: [
            GoRoute(
              path: '/users',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const UserList(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
              // routes: [
              //   GoRoute(
              //     path: '/users/:userId',
              //     name: "user",
              //     pageBuilder: (context, state) {
              //       return CustomTransitionPage(
              //         key: state.pageKey,
              //         child: UserInfo(
              //           id: int.parse(state.pathParameters['userId']!),
              //         ),
              //         transitionsBuilder:
              //             (context, animation, secondaryAnimation, child) {
              //           return FadeTransition(
              //             opacity: CurveTween(curve: Curves.easeInOutCirc)
              //                 .animate(animation),
              //             child: child,
              //           );
              //         },
              //       );
              //     },
              //     // builder: (context, state) => UserInfo(
              //     //   id: int.parse(state.pathParameters['userId']!),
              //     // ),
              //   ),
              //   GoRoute(
              //     path: '/user_add',
              //     name: "user_add",
              //     pageBuilder: (context, state) {
              //       return CustomTransitionPage(
              //         key: state.pageKey,
              //         child: const UserAdd(),
              //         transitionsBuilder:
              //             (context, animation, secondaryAnimation, child) {
              //           return FadeTransition(
              //             opacity: CurveTween(curve: Curves.easeInOutCirc)
              //                 .animate(animation),
              //             child: child,
              //           );
              //         },
              //       );
              //     },
              //     // builder: (context, state) => UserInfo(
              //     //   id: int.parse(state.pathParameters['userId']!),
              //     // ),
              //   ),
              // ],
              // builder: (context, state) => const UserList(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _favoriteNavigatorKey,
          routes: [
            GoRoute(
              path: '/favorites',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const FavoriteScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
              // builder: (context, state) => const UserList(),
            ),
          ],
        ),
      ],
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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return Layout(
          child: MaterialApp(
            theme: ThemeData(
              colorScheme: lightDynamic ?? const ColorScheme.light(),
            ),
            darkTheme: ThemeData(
              colorScheme: darkDynamic ?? const ColorScheme.dark(),
            ),
            themeMode: themeMode,
            home: MaterialApp.router(
              routerConfig: _router,
            ),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
