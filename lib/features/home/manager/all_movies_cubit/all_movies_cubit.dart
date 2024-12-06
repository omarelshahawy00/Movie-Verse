import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  AllMoviesCubit(this.homeRepo) : super(AllMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchMovies(String category) async {
    var result = await homeRepo.fetchMovies(category);
    emit(AllMoviesLoading());

    result.fold((failuer) {
      emit(
        AllMoviesFailure(failuer.errMessage),
      );
    }, (movie) {
      emit(
        AllMoviesSuccess(movie),
      );
      print('ssssssssssssssssssssssssssssssssssssssssssss');
    });
  }
}
