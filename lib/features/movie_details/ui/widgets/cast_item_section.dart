import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/helpers/routes.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/movie_details/data/models/cast_model.dart';

class CastItemSection extends StatelessWidget {
  const CastItemSection({super.key, required this.cast});
  final CastModel cast;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: cast.id!.toInt(),
            child: SizedBox(
              width: 75.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200.r),
                child: CachedNetworkImage(
                  imageUrl: cast.profilePath != null
                      ? '${ApiConstants.baseImageUrl}${cast.profilePath}'
                      : 'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_1280.png',
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                    child: Image.asset(
                      'assets/images/loading2.gif',
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Text(
            '${cast.name}',
            style: Styles.textStyle16,
          ),
          Text(
            '${cast.character}',
            style: Styles.textStyle14,
          ),
          Text(
            '${cast.knownForDepartment}',
            style: Styles.textStyle14,
          ),
        ],
      ),
    );
  }
}
