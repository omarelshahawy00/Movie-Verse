import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/core/helpers/styles.dart';
import 'package:movie_app/features/home/manager/all_movies_cubit/all_movies_cubit.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final List<String> categories = [
    'Popular',
    'Top Rated',
    'Upcoming',
  ];

  final Map<int, String> categoryEndpoints = {
    0: 'movie/popular',
    1: 'movie/top_rated',
    2: 'movie/upcoming',
  };

  int current = 0;
  @override
  void initState() {
    super.initState();
    context.read<AllMoviesCubit>().fetchMovies('movie/popular');
  }

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
              setState(() {
                current = index;
              });
              // Notify cubit of category change
              context
                  .read<AllMoviesCubit>()
                  .fetchMovies(categoryEndpoints[index]!);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: const EdgeInsets.all(5),
              width: 100.w,
              decoration: BoxDecoration(
                color: current == index
                    ? ColorManager.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(current == index ? 12 : 7),
                border: current == index
                    ? null
                    : Border.all(color: Colors.white30, width: 1.w),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w700,
                    color: current == index ? Colors.white : Colors.white30,
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



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movie_app/core/constants/color_manager.dart';
// import 'package:movie_app/core/helpers/styles.dart';

// class CategoryItem extends StatefulWidget {
//   const CategoryItem({
//     super.key,
//   });

//   @override
//   State<CategoryItem> createState() => _CategoryItemState();
// }

// class _CategoryItemState extends State<CategoryItem> {
//   final List<String> categories = [
//     'Popular',
//     'Now PLaying',
//     'Top Rated',
//     'Upcoming',
//   ];

//   int current = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 45.h,
//       child: ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         separatorBuilder: (context, index) => SizedBox(
//           width: 5.w,
//         ),
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 current = index;
//               });
//             },
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 100),
//               margin: const EdgeInsets.all(5),
//               width: 100.w,
//               height: 55.h,
//               decoration: BoxDecoration(
//                 color: current == index
//                     ? ColorManager.primaryColor
//                     : Colors.white54.withOpacity(0),
//                 borderRadius: current == index
//                     ? BorderRadius.circular(12)
//                     : BorderRadius.circular(7),
//                 border: current == index
//                     ? null
//                     : Border.all(color: Colors.white30, width: 1.w),
//               ),
//               child: Center(
//                 child: Text(
//                   categories[index],
//                   style: Styles.textStyle14.copyWith(
//                     fontWeight: FontWeight.w700,
//                     color: current == index ? Colors.white : Colors.white30,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
