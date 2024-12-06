import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/home/ui/home_screen.dart';
import 'package:movie_app/main_view.dart';

class Routes {
  static const String homeScreen = '/homeScreen';
  static const String splashScreen = '/splashScreen';
  static const String mainView = '/mainView';

  final router = GoRouter(
    // initialLocation: mainView,
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const BottomNavBar();
        },
      ),
      GoRoute(
        path: mainView,
        builder: (BuildContext context, GoRouterState state) {
          return const BottomNavBar();
        },
      ),
      GoRoute(
        path: homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        // builder: (context, state) => MultiBlocProvider(
        //   providers: [
        //     BlocProvider(
        //       create: (context) => TrendingMovieCubit(getIt.get<HomeRepoImpl>())
        //         ..fetchTrendingMovies(),
        //     ),
        //     BlocProvider(
        //       create: (context) => PopularMoviesCubit(getIt.get<HomeRepoImpl>())
        //         ..fetchPopularMovies(),
        //     ),
        //   ],
        //   child: const HomeScreen(),
        // ),
      ),
    ],
    // redirect: (BuildContext context, GoRouterState state) async {
    //   final prefs = await SharedPreferences.getInstance();
    //   final hasShownSplash = prefs.getBool('hasShownSplash') ?? false;

    //   if (state.uri.path == '/' && !hasShownSplash) {
    //     await prefs.setBool('hasShownSplash', true); // Mark splash as shown
    //     return splashScreen;
    //   } else if (state.uri.path == '/' && hasShownSplash) {
    //     return mainView;
    //   }
    //   return null; // No redirection
    // },
  );
}
