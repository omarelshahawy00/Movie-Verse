import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/helpers/get_it.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movie_app/features/home/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movie_app/features/home/manager/trending_movies_cubit/trending_movie_cubit.dart';
import 'package:movie_app/features/home/ui/home_screen.dart';
import 'package:movie_app/features/splash/ui/splash_screen.dart';
import 'package:movie_app/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // Routes()
  //     : router = GoRouter(
  //         initialLocation: mainView,
  //         routes: [
  //           GoRoute(
  //             path: mainView,
  //             builder: (BuildContext context, GoRouterState state) {
  //               return const BottomNavBar();
  //             },
  //           ),
  //           GoRoute(
  //             path: splashScreen,
  //             builder: (BuildContext context, GoRouterState state) {
  //               return const SplashScreen();
  //             },
  //           ),
  //           GoRoute(
  //             path: homeScreen,
  //             builder: (context, state) => MultiBlocProvider(
  //               providers: [
  //                 BlocProvider(
  //                   create: (context) =>
  //                       TrendingMovieCubit(getIt.get<HomeRepoImpl>())
  //                         ..fetchTrendingMovies(),
  //                 ),
  //                 BlocProvider(
  //                   create: (context) =>
  //                       PopularMoviesCubit(getIt.get<HomeRepoImpl>())
  //                         ..fetchPopularMovies(),
  //                 ),
  //               ],
  //               child: const HomeScreen(),
  //             ),
  //           ),
  //         ],
  //         redirect: (BuildContext context, GoRouterState state) async {
  //           final prefs = await SharedPreferences.getInstance();
  //           final hasShownSplash = prefs.getBool('hasShownSplash') ?? false;

  //           if (state.uri.path == '/' && !hasShownSplash) {
  //             await prefs.setBool(
  //                 'hasShownSplash', true); // Mark splash as shown
  //             return splashScreen;
  //           } else if (state.uri.path == '/' && hasShownSplash) {
  //             return homeScreen;
  //           }
  //           return null; // No redirection
  //         },
  //       );
}
