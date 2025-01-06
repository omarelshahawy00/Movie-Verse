part of 'cast_cubit.dart';

class CastState {}

final class CastInitial extends CastState {}

final class CastLoading extends CastState {}

final class CastSuccess extends CastState {
  final List<CastModel> cast;
  CastSuccess(this.cast);
}

final class CastFailure extends CastState {
  final String errMessage;

  CastFailure(this.errMessage);
}
