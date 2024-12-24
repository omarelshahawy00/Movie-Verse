part of 'actor_cubit.dart';

sealed class ActorState {}

final class ActorInitial extends ActorState {}

final class ActorLoading extends ActorState {}

final class ActorSuccess extends ActorState {
  final ActorModel actor;

  ActorSuccess(this.actor);
}

final class ActorFailure extends ActorState {
  final String message;

  ActorFailure(this.message);
}
