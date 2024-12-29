import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';

part 'all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  List<MovieModel> movieModel = [];
  AllMoviesCubit(this.homeRepo) : super(AllMoviesInitial());
  final HomeRepoImpl homeRepo;
  Future<List<MovieModel>> fetchMovies(String? category) async {
    emit(AllMoviesLoading());
    final result = await homeRepo.fetchMovies(category);
    result.fold(
      (failuer) {
        emit(
          AllMoviesFailure(failuer.errMessage),
        );
      },
      (movie) {
        emit(
          AllMoviesSuccess(movie),
        );
        movieModel = movie;
      },
    );
    return movieModel;
  }
}
