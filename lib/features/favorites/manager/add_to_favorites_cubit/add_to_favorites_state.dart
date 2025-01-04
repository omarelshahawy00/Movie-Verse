part of 'add_to_favorites_cubit.dart';

class AddToFavoritesState {}

final class AddToFavoritesInitial extends AddToFavoritesState {}

final class AddToFavoritesSuccess extends AddToFavoritesState {}

final class AddToFavoritesFailure extends AddToFavoritesState {
  final String errMessage;

  AddToFavoritesFailure(this.errMessage);
}

final class AddToFavoritesDelete extends AddToFavoritesState {}

final class AddToFavoritesClearAll extends AddToFavoritesState {}
