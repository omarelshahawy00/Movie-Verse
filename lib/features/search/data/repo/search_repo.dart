import 'package:movie_app/features/search/data/models/search_model.dart';

abstract class SearchRepo {
  Future<List<SearchModel>> searchMovies(String query);
}
