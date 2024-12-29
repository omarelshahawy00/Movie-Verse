import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/rating_item.dart';
import 'package:movie_app/features/favorites/data/hive_services.dart';
import 'package:movie_app/features/favorites/data/models/favorites_model.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class MainMovieItem extends StatefulWidget {
  const MainMovieItem({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  State<MainMovieItem> createState() => _MainMovieItemState();
}

class _MainMovieItemState extends State<MainMovieItem> {
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    // Check if the movie is already in favorites
    isFav =
        HiveServices.getItems().any((item) => item.id == widget.movieModel.id);
  }

  void _toggleFavorite() {
    setState(() {
      isFav = !isFav;
    });

    if (isFav) {
      HiveServices.addItem(
          movie: FavoritesModel(
        posterPath: widget.movieModel.posterPath!,
        title: widget.movieModel.title!,
        id: widget.movieModel.id!,
        voteAverage: widget.movieModel.voteAverage!,
        voteCount: widget.movieModel.voteCount!,
      ));
    } else {
      if (widget.movieModel.id != null) {
        HiveServices.deleteItem(widget.movieModel.id!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 36, 36, 36).withOpacity(.85),
                  const Color.fromARGB(255, 36, 36, 36).withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                stops: [0.4, 1.0],
              ),
            ),
            child: Hero(
              tag: widget.movieModel.id!.toInt(),
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: Image.asset('assets/images/loading2.gif'),
                ),
                imageUrl:
                    '${ApiConstants.baseImageUrl}${widget.movieModel.posterPath}',
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        Positioned(
          left: 120,
          top: 200,
          child: GestureDetector(
            onTap: _toggleFavorite,
            child: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              size: 30,
              color: ColorManager.primaryColor,
            ),
          ),
        ),
        Positioned(
          bottom: 30.h,
          left: 7.5.w,
          right: 0,
          child: Container(
            margin: EdgeInsets.only(left: 7.5.w, right: 50.w),
            child: Text(
              widget.movieModel.title ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style:
                  Styles.textStyle16.copyWith(overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
        Positioned(
          bottom: 8.h,
          left: 15.w,
          right: 0,
          child: RatingItem(
            avg:
                double.parse(widget.movieModel.voteAverage!.toStringAsFixed(1)),
            count: widget.movieModel.voteCount!.toInt(),
          ),
        ),
      ],
    );
  }
}
