import 'package:movie_app/core/helpers/credits_api_service.dart';
import 'package:movie_app/features/actor_details/data/model/actor_model.dart';
import 'package:movie_app/features/actor_details/data/model/actor_movies_model.dart';
import 'package:movie_app/features/actor_details/data/repo/actor_repo.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class ActorRepoImpl extends ActorRepo {
  final CreditsApiService creditsApiService;

  ActorRepoImpl(this.creditsApiService);
  @override
  Future<ActorModel> getActorDetails(int? personId) async {
    try {
      final actor = await creditsApiService.getPersonData(personId: personId!);
      return ActorModel.fromJson(actor);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getActorMovies(int personId) async {
    final actorMovie =
        await creditsApiService.getPersonMovies(personId: personId);
    List<MovieModel> actorMovies = [];
    for (var movie in actorMovie['cast']) {
      actorMovies.add(MovieModel.fromJson(movie));
    }
    return actorMovies;
  }
}
