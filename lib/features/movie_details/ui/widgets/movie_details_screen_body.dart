import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/helpers/get_it.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/helpers/styles.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading_indecator.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/movie_details/data/repos/details_repo_impl.dart';
import 'package:movie_app/features/movie_details/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/features/movie_details/ui/widgets/cast_item_section.dart';
import 'package:movie_app/features/movie_details/ui/widgets/details_section.dart';

class MovieDetailsScreenBody extends StatelessWidget {
  const MovieDetailsScreenBody({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CastCubit(getIt.get<DetailsRepoImpl>())..fetchCastData(movie.id),
      child: SafeArea(
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
      ),
    );
  }
}
