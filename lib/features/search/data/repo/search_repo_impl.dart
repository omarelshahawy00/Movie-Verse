import 'package:movie_app/core/helpers/credits_api_service.dart';
import 'package:movie_app/features/search/data/models/search_model.dart';
import 'package:movie_app/features/search/data/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final CreditsApiService creditsApiService;

  SearchRepoImpl(this.creditsApiService);
  @override
  Future<List<SearchModel>> searchMovies(String query) async {
    var results = await creditsApiService.getSearchedMovies(query: query);
    List<SearchModel> searchResults = [];
    for (var movie in results['results']) {
      searchResults.add(SearchModel.fromJson(movie));
    }
    return searchResults;
  }
}
