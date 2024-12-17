import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/core/helpers/get_it.dart';
import 'package:movie_app/core/helpers/routes.dart';
import 'package:movie_app/features/home/manager/simple_bloc_observer.dart';

void main() {
  setup();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Routes().router,
        theme: ThemeData.dark(
          useMaterial3: false,
        ).copyWith(
          scaffoldBackgroundColor:
              Colors.transparent, // Transparent for gradient
        ),
        builder: (context, child) {
          return GradientBackground(
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.gradColor1,
            ColorManager.gradColor2,
          ], // Your gradient colors
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: child,
    );
  }
}
