import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movie_details/data/models/cast_model.dart';
import 'package:movie_app/features/movie_details/data/models/video_model.dart';

abstract class DetailsRepo {
  Future<Either<Failure, List<CastModel>>> fetchCastData(int movieId);
  Future<Either<Failure, List<VideoModel>>> fetchTrailerLink(int movieId);
}
