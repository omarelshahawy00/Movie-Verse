import 'package:movie_app/core/helpers/credits_api_service.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/search/data/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final CreditsApiService creditsApiService;

  SearchRepoImpl(this.creditsApiService);
  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    var results = await creditsApiService.getSearchedMovies(query: query);
    List<MovieModel> searchResults = [];
    for (var movie in results['results']) {
      searchResults.add(MovieModel.fromJson(movie));
    }
    return searchResults;
  }
}
