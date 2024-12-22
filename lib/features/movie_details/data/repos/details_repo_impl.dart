import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/helpers/credits_api_service.dart';
import 'package:movie_app/features/movie_details/data/models/cast_model.dart';
import 'package:movie_app/features/movie_details/data/repos/details_repo.dart';

class DetailsRepoImpl extends DetailsRepo {
  final CreditsApiService creditsApiService;

  DetailsRepoImpl(this.creditsApiService);
  @override
  Future<Either<Failure, List<CastModel>>> fetchCastData(int? movieId) async {
    try {
      var data = await creditsApiService.getCastsData(movieId: movieId!);

      List<CastModel> cast = [];
      for (var person in data['cast']) {
        cast.add(CastModel.fromJson(person));
      }
      return right(cast);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioError(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }
}
