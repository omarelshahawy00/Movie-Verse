import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/movie_details/ui/widgets/cast_list_section.dart';
import 'package:movie_app/features/movie_details/ui/widgets/details_section.dart';
import 'package:movie_app/features/movie_details/ui/widgets/stretched_appbar.dart';
import 'package:movie_app/features/search/data/models/search_model.dart';

class MovieDetailsScreenBody extends StatelessWidget {
  const MovieDetailsScreenBody({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            StretchedAppbar(movie: movie),
            SliverToBoxAdapter(
              child: verticalSpace(20),
            ),
            SliverToBoxAdapter(
              child: DetailsSection(
                movie: movie,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cast',
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    verticalSpace(15),
                  ],
                ),
              ),
            ),
            const CastListSection(),
          ],
        ),
      ),
    );
  }
}
