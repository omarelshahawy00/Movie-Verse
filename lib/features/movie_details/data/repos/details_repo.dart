import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movie_details/data/models/cast_model.dart';

abstract class DetailsRepo {
  Future<Either<Failure, List<CastModel>>> fetchCastData(int movieId);
}
