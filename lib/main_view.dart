import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/core/helpers/get_it.dart';
import 'package:movie_app/features/favorites/manager/add_to_favorites_cubit/add_to_favorites_cubit.dart';
import 'package:movie_app/features/favorites/manager/favorites_cubit/favorites_cubit.dart';
import 'package:movie_app/features/favorites/ui/favorites_screen.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movie_app/features/home/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:movie_app/features/home/manager/category_cubit/category_cubit.dart';
import 'package:movie_app/features/home/manager/navbar_cubit/bottom_navbar_cubit.dart';
import 'package:movie_app/features/home/manager/trending_movies_cubit/trending_movie_cubit.dart';
import 'package:movie_app/features/home/ui/home_screen.dart';
import 'package:movie_app/features/search/ui/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  // Pages for each tab
  final List<Widget> pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TrendingMovieCubit(getIt.get<HomeRepoImpl>())),
        BlocProvider(
          create: (context) => AllMoviesCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
        BlocProvider(create: (context) => AddToFavoritesCubit()),
      ],
      child: const HomeScreen(),
    ),
    const SearchScreen(),
    BlocProvider(
      create: (context) => FavoritesCubit()..getFavorites(),
      child: const FavoritesScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavbarCubit, int>(
        builder: (context, state) {
          return pages[
              BlocProvider.of<BottomNavbarCubit>(context).currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavbarCubit, int>(
        builder: (context, currentIndex) {
          return BottomNavigationBar(
            backgroundColor: Colors.red,
            showSelectedLabels: false,
            type: BottomNavigationBarType.shifting,
            currentIndex:
                BlocProvider.of<BottomNavbarCubit>(context).currentIndex,
            selectedItemColor: ColorManager.primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: (index) =>
                BlocProvider.of<BottomNavbarCubit>(context).selectedTab(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 28,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 28,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 28,
                ),
                label: 'Favorites',
              ),
            ],
          );
        },
      ),
    );
  }
}
