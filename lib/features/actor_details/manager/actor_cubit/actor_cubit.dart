import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:movie_app/features/actor_details/data/model/actor_model.dart';
import 'package:movie_app/features/actor_details/data/repo/actor_repo_impl.dart';

part 'actor_state.dart';

class ActorCubit extends Cubit<ActorState> {
  ActorCubit(this.actorRepoImpl) : super(ActorInitial());
  final ActorRepoImpl actorRepoImpl;
  ActorModel? actor;

  Future<void> fetchActorData(int? personId) async {
    emit(ActorLoading());
    actorRepoImpl.getActorDetails(personId!).then(
      (actor) {
        emit(ActorSuccess(actor));
        this.actor = actor;
      },
    );
  }
}
