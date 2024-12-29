import 'package:movie_app/features/favorites/data/models/favorites_model.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

extension FavoritesModelExtension on FavoritesModel {
  MovieModel toMovieModel() {
    return MovieModel(
      id: id,
      title: title,
      posterPath: posterPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
      overview: overview,
      originalLanguage: mainLanguage,
      releaseDate: releaseDate,
    );
  }
}
