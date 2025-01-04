part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesSuccess extends FavoritesState {
  final List<FavoritesModel> favorites;

  FavoritesSuccess(this.favorites);
}

final class FavoritesFailure extends FavoritesState {
  final String errMessage;

  FavoritesFailure(this.errMessage);
}
