import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/widgets/custom_app_bar.dart';
import 'package:movie_app/core/widgets/custom_loading_indecator.dart';
import 'package:movie_app/features/home/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:movie_app/features/home/manager/category_cubit/category_cubit.dart';
import 'package:movie_app/features/home/manager/category_cubit/category_state.dart';
import 'package:movie_app/features/home/ui/widgets/category_item.dart';
import 'package:movie_app/features/home/ui/widgets/main_movie_item.dart';
import 'package:movie_app/features/home/ui/widgets/sliding_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({super.key});

  final List<String> categories = [
    'Popular',
    'Top Rated',
    'Upcoming',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(10),
                CustomAppBar(onPressed: () {}),
                verticalSpace(10),
                const SlidingListView(),
                verticalSpace(15),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                return CategoryItem(
                  categories: categories,
                  selectedIndex:
                      BlocProvider.of<CategoryCubit>(context).currentIndex,
                );
              },
            ),
          ),
          BlocBuilder<AllMoviesCubit, AllMoviesState>(
            builder: (context, state) {
              if (state is AllMoviesSuccess) {
                return SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => MainMovieItem(
                        movieModel: state.movie[index],
                      ),
                      childCount: state.movie.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.7,
                    ),
                  ),
                );
              } else if (state is AllMoviesFailure) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.errMessage)),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Column(
                    children: [
                      verticalSpace(100),
                      const CustomLoadingIndecator(),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
