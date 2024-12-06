import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/bottom_nav_bar.dart';
import 'package:movie_app/features/home/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HomeScreenBody(),
      ),
    );
  }
}
