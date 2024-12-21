import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/helpers/styles.dart';
import 'package:movie_app/core/widgets/rating_item.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class MovieDetailsScreenBody extends StatelessWidget {
  const MovieDetailsScreenBody({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xff232e40),
              elevation: 0,
              expandedHeight: 400,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: movie.id!.toInt(),
                  child: Image.network(
                    '${ApiConstants.baseImageUrl}${movie.posterPath}',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    '${movie.title}',
                    style: Styles.textStyle20
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(20),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  width: 1.w,
                                  color:
                                      const Color.fromARGB(255, 146, 146, 146),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text('Release Date : ${movie.releaseDate}'),
                              ),
                            ),
                            verticalSpace(10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 146, 146, 146),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Main Language : ${movie.originalLanguage!.toUpperCase()}'),
                              ),
                            ),
                          ],
                        ),
                        horizontalSpace(50),
                        RatingItem(
                          count: movie.voteCount!.toInt(),
                          avg: double.parse(
                              movie.voteAverage!.toStringAsFixed(1)),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Text(
                      'Overview',
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    verticalSpace(10),
                    Text(
                      '${movie.overview}',
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    verticalSpace(300),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
