import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading_indecator.dart';
import 'package:movie_app/features/home/manager/trending_movies_cubit/trending_movie_cubit.dart';
import 'package:movie_app/features/home/ui/widgets/top_movie_item.dart';
import '../../manager/trending_movies_cubit/trending_movie_state.dart';

class SlidingListView extends StatelessWidget {
  const SlidingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
        builder: (context, state) {
          if (state is TrendingMovieSuccess) {
            return CarouselSlider.builder(
              options: CarouselOptions(
                enlargeFactor: .3,
                height: 350.h,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: .8,
                aspectRatio: 9 / 9,
              ),
              itemCount: state.movies.length,
              itemBuilder: (context, index, realIndex) {
                final movie = state.movies[index];
                return TopMovieItem(
                  urlImage: movie.posterPath ?? '',
                );
              },
            );
          } else if (state is TrendingMovieFailure) {
            return Center(
              child: CustomError(errMessage: state.errMessage),
            );
          } else {
            return const Center(
              child: SizedBox(
                height: 250,
                width: 150,
                child: CustomLoadingIndecator(),
              ),
            );
          }
        },
      ),
    );
  }
}
