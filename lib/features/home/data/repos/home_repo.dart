import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMovies();
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies();

  Future<Either<Failure, List<MovieModel>>> fetchMovies(String category);
}
