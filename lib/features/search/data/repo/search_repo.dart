import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/search/data/models/search_model.dart';

abstract class SearchRepo {
  Future<List<MovieModel>> searchMovies(String query);
}
