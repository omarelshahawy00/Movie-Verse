import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/features/home/manager/trending_movies_cubit/trending_movie_state.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {
  TrendingMovieCubit(this.homeRepo) : super(TrendingMovieInitial());
  final HomeRepo homeRepo;

  Future<void> fetchTrendingMovies() async {
    emit(TrendingMovieLoading());
    var result = await homeRepo.fetchTrendingMovies();
    result.fold(
      (failure) {
        emit(
          TrendingMovieFailure(failure.errMessage),
        );
      },
      (movies) {
        emit(
          TrendingMovieSuccess(movies),
        );
      },
    );
  }
}
