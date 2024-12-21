import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/features/home/manager/navbar_cubit/bottom_navbar_cubit.dart';
import 'package:movie_app/features/home/ui/home_screen.dart';
import 'package:movie_app/features/search/ui/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  // Pages for each tab
  final List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const Center(
      child: Text('favorites'),
    )
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
