import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/search/data/models/search_model.dart';
import 'package:movie_app/features/search/data/repo/search_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImpl) : super(SearchInitial());
  final SearchRepoImpl searchRepoImpl;

  Future<void> searchMovies(String query) async {
    emit(SearchLoading());

    searchRepoImpl.searchMovies(query).then(
      (movies) {
        emit(SearchSuccess(movies));
      },
    ).catchError((e) {
      emit(SearchFailure(e.toString()));
    });
  }
}
