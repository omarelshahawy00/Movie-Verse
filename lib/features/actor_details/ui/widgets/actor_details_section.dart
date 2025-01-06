import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/custom_rounded_container.dart';
import 'package:movie_app/features/actor_details/data/model/actor_model.dart';

class ActorDetailsSection extends StatelessWidget {
  const ActorDetailsSection({super.key, required this.actorModel});
  final ActorModel actorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(0),
        Center(
          child: SizedBox(
            height: 200.h,
            width: 150.w,
            child: Hero(
              tag: actorModel.id!.toInt(),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: CachedNetworkImage(
                    imageUrl: actorModel.profilePath != null
                        ? '${ApiConstants.baseImageUrl}${actorModel.profilePath}'
                        : 'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_1280.png',
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Center(
                      child: Image.asset(
                        'assets/images/loading2.gif',
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )),
            ),
          ),
        ),
        Column(
          children: [
            verticalSpace(10),
            Text(
              '${actorModel.name}',
              style: Styles.textStyle20.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            verticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRoundedContainer(
                    insideTitle:
                        'Known for department : ${actorModel.knownForDepartment}'),
              ],
            ),
            verticalSpace(10),
            CustomRoundedContainer(
                borderWidth: 1.5,
                insideTitle: 'Place of Birth : ${actorModel.placeOfBirth}'),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRoundedContainer(
                    insideTitle: 'Birthday: ${actorModel.birthday}'),
                CustomRoundedContainer(
                    insideTitle: 'Deathday :  ${actorModel.deathday}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
