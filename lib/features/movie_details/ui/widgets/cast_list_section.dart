import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/helpers/routes.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading_indecator.dart';
import 'package:movie_app/features/movie_details/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/features/movie_details/ui/widgets/cast_item_section.dart';

class CastListSection extends StatelessWidget {
  const CastListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastSuccess) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 180.h,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.cast.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(
                            Routes.actorDetailsScreen,
                            extra: state.cast[index],
                          );
                        },
                        child: CastItemSection(
                          cast: state.cast[index],
                        ),
                      ),
                    );
                  },
                ),
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
    );
  }
}
