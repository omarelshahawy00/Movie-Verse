import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/movie_details/ui/widgets/movie_details_screen_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return MovieDetailsScreenBody(
      movie: movie,
    );
  }
}
