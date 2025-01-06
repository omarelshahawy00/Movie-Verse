import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/get_it.dart';
import 'package:movie_app/features/actor_details/data/repo/actor_repo_impl.dart';
import 'package:movie_app/features/actor_details/manager/actor_cubit/actor_cubit.dart';
import 'package:movie_app/features/actor_details/manager/actor_movies_cubit/actor_movies_cubit.dart';
import 'package:movie_app/features/actor_details/ui/widgets/actor_details_screen_body.dart';
import 'package:movie_app/features/movie_details/data/models/cast_model.dart';

class ActorDetailsScreen extends StatelessWidget {
  const ActorDetailsScreen({super.key, required this.cast});
  final CastModel cast;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ActorCubit(getIt.get<ActorRepoImpl>())..fetchActorData(cast.id),
        ),
        BlocProvider(
          create: (context) => ActorMoviesCubit(getIt.get<ActorRepoImpl>())
            ..fetchActorMovies(cast.id),
        ),
      ],
      child: const ActorDetailsScreenBody(),
    );
  }
}
