import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/widgets/custom_app_bar.dart';
import 'package:movie_app/core/widgets/custom_loading_indecator.dart';
import 'package:movie_app/features/home/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:movie_app/features/home/ui/widgets/category_item.dart';
import 'package:movie_app/features/home/ui/widgets/main_movie_item.dart';
import 'package:movie_app/features/home/ui/widgets/sliding_list_view.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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
          const SliverToBoxAdapter(
            child: CategoryItem(),
          ),
          BlocBuilder<AllMoviesCubit, AllMoviesState>(
            builder: (context, state) {
              if (state is AllMoviesLoading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is AllMoviesSuccess) {
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
                return const SliverToBoxAdapter(
                  child: CustomLoadingIndecator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// class HomeScreenBody extends StatefulWidget {
//   const HomeScreenBody({
//     super.key,
//   });

//   @override
//   State<HomeScreenBody> createState() => _HomeScreenBodyState();
// }

// class _HomeScreenBodyState extends State<HomeScreenBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10.h),
//       child: CustomScrollView(
//         physics: const BouncingScrollPhysics(),
//         slivers: [
//           // Header Section
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 verticalSpace(10),
//                 CustomAppBar(
//                   onPressed: () {},
//                 ),
//                 verticalSpace(10),
//                 const SlidingListView(),
//                 verticalSpace(15),
//               ],
//             ),
//           ),
//           // Title Section
//           const SliverToBoxAdapter(
//             child: CategoryItem(),
//           ),
//           // Grid Section
//           BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
//             builder: (context, state) {
//               if (state is PopularMoviesSuccess) {
//                 return SliverPadding(
//                   padding: EdgeInsets.symmetric(vertical: 20.h),
//                   sliver: SliverGrid(
//                     delegate: SliverChildBuilderDelegate(
//                       (context, index) => MainMovieItem(
//                         movieModel: state.movies[index],
//                       ),
//                       childCount:
//                           state.movies.length, // Set the number of items here
//                     ),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, // Number of items per row
//                       crossAxisSpacing: 15, // Space between columns
//                       mainAxisSpacing: 15, // Space between rows
//                       childAspectRatio:
//                           0.7, // Adjust the aspect ratio as needed
//                     ),
//                   ),
//                 );
//               } else if (state is PopularMoviesFailure) {
//                 return CustomError(errMessage: state.errMessage);
//               } else {
//                 return const SliverToBoxAdapter(
//                   child: CustomLoadingIndecator(),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreenBody extends StatefulWidget {
//   const HomeScreenBody({
//     super.key,
//   });

//   @override
//   State<HomeScreenBody> createState() => _HomeScreenBodyState();
// }

// class _HomeScreenBodyState extends State<HomeScreenBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10.h),
//       child: CustomScrollView(
//         physics: const BouncingScrollPhysics(),
//         slivers: [
//           // Header Section
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 verticalSpace(10),
//                 CustomAppBar(
//                   onPressed: () {},
//                 ),
//                 verticalSpace(10),
//                 const SlidingListView(),
//                 verticalSpace(15),
//               ],
//             ),
//           ),
//           // Title Section
//           const SliverToBoxAdapter(
//             child: CategoryItem(),
//           ),
//           // Grid Section
//           BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
//             builder: (context, state) {
//               if (state is PopularMoviesSuccess) {
//                 return SliverPadding(
//                   padding: EdgeInsets.symmetric(vertical: 20.h),
//                   sliver: SliverGrid(
//                     delegate: SliverChildBuilderDelegate(
//                       (context, index) => MainMovieItem(
//                         movieModel: state.movies[index],
//                       ),
//                       childCount:
//                           state.movies.length, // Set the number of items here
//                     ),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, // Number of items per row
//                       crossAxisSpacing: 15, // Space between columns
//                       mainAxisSpacing: 15, // Space between rows
//                       childAspectRatio:
//                           0.7, // Adjust the aspect ratio as needed
//                     ),
//                   ),
//                 );
//               } else if (state is PopularMoviesFailure) {
//                 return CustomError(errMessage: state.errMessage);
//               } else {
//                 return const SliverToBoxAdapter(
//                   child: CustomLoadingIndecator(),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
