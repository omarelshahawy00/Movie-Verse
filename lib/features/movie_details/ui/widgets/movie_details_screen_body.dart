import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/helpers/styles.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading_indecator.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/movie_details/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/features/movie_details/manager/trailer/trailer_cubit.dart';
import 'package:movie_app/features/movie_details/ui/widgets/cast_item_section.dart';
import 'package:movie_app/features/movie_details/ui/widgets/details_section.dart';
import 'package:url_launcher/url_launcher.dart';

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
              flexibleSpace: BlocBuilder<TrailerCubit, TrailerState>(
                builder: (context, state) {
                  if (state is TrailerSuccess) {
                    return FlexibleSpaceBar(
                      background: Hero(
                        tag: movie.id!.toInt(),
                        child: GestureDetector(
                          onTap: () async {
                            Uri url = Uri.parse(
                                '${ApiConstants.youtubeBaseUrl}${state.video[0].key}'); //HyIyd9joTTc

                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            } else {
                              launchUrl(url);
                            }
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                bottom: 0,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.r),
                                    bottomRight: Radius.circular(30.r),
                                  ),
                                  child: Image.network(
                                    '${ApiConstants.baseImageUrl}${movie.posterPath}',
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Center(
                                  child: Icon(
                                    Icons.play_circle_outlined,
                                    size: 80,
                                    color:
                                        const Color.fromARGB(255, 241, 239, 239)
                                            .withOpacity(.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                    );
                  } else if (state is TrailerFailure) {
                    return CustomError(errMessage: state.errMessage);
                  } else {
                    return Image.asset(
                      'assets/images/loading2.gif',
                    );
                  }
                },
              ),
            ),
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
            BlocBuilder<CastCubit, CastState>(
              builder: (context, state) {
                if (state is CastSuccess) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 180.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.cast.length,
                        itemBuilder: (context, index) {
                          return CastItemSection(
                            cast: state.cast[index],
                          );
                        },
                      ),
                    ),
                  );
                } else if (state is CastFailure) {
                  return CustomError(errMessage: state.errMessage);
                } else {
                  return const SliverToBoxAdapter(
                    child: CustomLoadingIndecator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
