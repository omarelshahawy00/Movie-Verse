import 'package:bloc/bloc.dart';
import 'package:movie_app/features/movie_details/data/models/cast_model.dart';
import 'package:movie_app/features/movie_details/data/repos/details_repo_impl.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit(this.detailsRepoImpl) : super(CastInitial());
  final DetailsRepoImpl detailsRepoImpl;

  fetchCastData(int? movieId) async {
    emit(CastLoading());
    final result = await detailsRepoImpl.fetchCastData(movieId!);
    result.fold((failure) {
      emit(CastFailure(failure.errMessage));
    }, (cast) {
      emit(CastSuccess(cast));
    });
  }
}
