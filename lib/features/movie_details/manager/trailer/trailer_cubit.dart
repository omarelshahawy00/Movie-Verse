import 'package:bloc/bloc.dart';
import 'package:movie_app/features/movie_details/data/models/video_model.dart';
import 'package:movie_app/features/movie_details/data/repos/details_repo_impl.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit(this.detailsRepoImpl) : super(TrailerInitial());

  final DetailsRepoImpl detailsRepoImpl;

  fetchTrailerData(int? movieId) async {
    emit(Trailerloading());
    var result = await detailsRepoImpl.fetchTrailerLink(movieId);
    result.fold((failure) {
      emit(TrailerFailure(failure.errMessage));
    }, (trailer) {
      emit(
        TrailerSuccess(trailer),
      );
    });
  }
}
