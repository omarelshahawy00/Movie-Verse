import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/features/home/ui/home_screen.dart';
import 'package:movie_app/features/search/ui/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // Pages for each tab
  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const Center(child: Text('favorites'))
  ];

  // Handle tap on BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        showSelectedLabels: false,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
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
      ),
    );
  }
}
