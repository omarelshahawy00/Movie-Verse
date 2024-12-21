import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.homeRepo) : super(PopularMoviesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchPopularMovies() async {
    var result = await homeRepo.fetchPopularMovies();
    result.fold((failuer) {
      emit(
        PopularMoviesFailure(failuer.errMessage),
      );
    }, (movie) {
      emit(
        PopularMoviesSuccess(movie),
      );
    });
  }
}
