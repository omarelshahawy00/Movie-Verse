import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/core/helpers/styles.dart';
import 'package:movie_app/features/home/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:movie_app/features/home/manager/category_cubit/category_cubit.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    this.onCategorySelected,
    required this.selectedIndex,
  });

  final void Function(int)? onCategorySelected;

  final int selectedIndex;

  static final Map<int, String> categoryEndpoints = {
    0: 'movie/popular',
    1: 'movie/top_rated',
    2: 'movie/upcoming',
  };
  static final List<String> categories = [
    'Popular',
    'Top Rated',
    'Upcoming',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5.w),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<CategoryCubit>(context).selectButton(index);
              if (selectedIndex != index) {
                BlocProvider.of<AllMoviesCubit>(context)
                    .fetchMovies(categoryEndpoints[index]);
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: const EdgeInsets.all(5),
              width: 100.w,
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? ColorManager.primaryColor
                    : Colors.transparent,
                borderRadius:
                    BorderRadius.circular(selectedIndex == index ? 12 : 7),
                border: selectedIndex == index
                    ? null
                    : Border.all(color: Colors.white30, width: 1.w),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w700,
                    color:
                        selectedIndex == index ? Colors.white : Colors.white30,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
