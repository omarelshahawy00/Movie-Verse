import 'package:bloc/bloc.dart';
import 'package:movie_app/features/favorites/data/hive_services.dart';
import 'package:movie_app/features/favorites/data/models/favorites_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  getFavorites() {
    emit(FavoritesLoading());

    try {
      var result = HiveServices.getItems();

      emit(FavoritesSuccess(result));
    } on Exception catch (e) {
      emit(FavoritesFailure(e as String));
    }
  }
}
