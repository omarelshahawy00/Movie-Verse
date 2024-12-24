part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<SearchModel> movies;

  SearchSuccess(this.movies);
}

final class SearchFailure extends SearchState {
  final String message;

  SearchFailure(this.message);
}
