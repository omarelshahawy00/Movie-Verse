import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/helpers/api_service.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMovies() async {
    try {
      var data = await apiService.getMoviesData(
          endPoint: ApiConstants.trendingMoviesUrl);

      List<MovieModel> movies = [];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioError(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async {
    try {
      var data = await apiService.getMoviesData(
          endPoint: ApiConstants.popularMoviesUrl);

      List<MovieModel> movies = [];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioError(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies() async {
    try {
      var data = await apiService.getMoviesData(
          endPoint: ApiConstants.topRatedMoviesUrl);

      List<MovieModel> movies = [];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioError(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchMovies(String category) async {
    try {
      var data =
          await apiService.getMoviesData(endPoint: '$category?language=en-US');

      List<MovieModel> movies = [];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioError(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }
}
