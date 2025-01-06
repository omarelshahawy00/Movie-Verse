part of 'trailer_cubit.dart';

class TrailerState {}

final class TrailerInitial extends TrailerState {}

final class Trailerloading extends TrailerState {}

final class TrailerSuccess extends TrailerState {
  final List<VideoModel> video;

  TrailerSuccess(this.video);
}

final class TrailerFailure extends TrailerState {
  final String errMessage;

  TrailerFailure(this.errMessage);
}
