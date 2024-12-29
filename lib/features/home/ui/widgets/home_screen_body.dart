import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/widgets/custom_app_bar.dart';
import 'package:movie_app/features/home/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:movie_app/features/home/manager/category_cubit/category_cubit.dart';
import 'package:movie_app/features/home/manager/trending_movies_cubit/trending_movie_cubit.dart';
import 'package:movie_app/features/home/ui/widgets/category_item.dart';
import 'package:movie_app/features/home/ui/widgets/movies_grid_view.dart';
import 'package:movie_app/features/home/ui/widgets/sliding_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

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
            child: BlocBuilder<CategoryCubit, int>(
              builder: (context, state) {
                return CategoryItem(
                  selectedIndex:
                      BlocProvider.of<CategoryCubit>(context).currentIndex,
                );
              },
            ),
          ),
          const MoviesGridView(),
        ],
      ),
    );
  }
}
