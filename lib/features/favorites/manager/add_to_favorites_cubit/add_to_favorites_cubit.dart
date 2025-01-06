import 'package:bloc/bloc.dart';
import 'package:movie_app/features/favorites/data/hive_services.dart';
import 'package:movie_app/features/favorites/data/models/favorites_model.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

part 'add_to_favorites_state.dart';

class AddToFavoritesCubit extends Cubit<AddToFavoritesState> {
  AddToFavoritesCubit() : super(AddToFavoritesInitial());

  Future<void> addDataToHive(FavoritesModel favoritesData) async {
    try {
      await HiveServices.addItem(movie: favoritesData);
      emit(AddToFavoritesSuccess());
    } on Exception catch (e) {
      emit(AddToFavoritesFailure(e.toString()));
    }
  }

  Future<void> removeItemFromHive(int id) async {
    try {
      await HiveServices.deleteItem(id);
      emit(AddToFavoritesDelete());
    } on Exception catch (e) {
      emit(AddToFavoritesFailure(e.toString()));
    }
  }
}
