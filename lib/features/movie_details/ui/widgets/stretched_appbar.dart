import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/movie_details/manager/trailer/trailer_cubit.dart';
import 'package:movie_app/features/movie_details/ui/widgets/background_img_with_play_icon.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/custom_error.dart';

class StretchedAppbar extends StatelessWidget {
  const StretchedAppbar({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
                  child: BackgroundImgWithPlayIcon(
                    movie: movie,
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(
                  '${movie.title}',
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
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
    );
  }
}
