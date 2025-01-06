import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/helpers/api_service.dart';
import 'package:movie_app/core/helpers/credits_api_service.dart';
import 'package:movie_app/features/actor_details/data/repo/actor_repo_impl.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movie_app/features/movie_details/data/repos/details_repo_impl.dart';
import 'package:movie_app/features/search/data/repo/search_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<CreditsApiService>(
    CreditsApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<DetailsRepoImpl>(
    DetailsRepoImpl(getIt.get<CreditsApiService>()),
  );

  getIt.registerSingleton<ActorRepoImpl>(
    ActorRepoImpl(getIt.get<CreditsApiService>()),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<CreditsApiService>()),
  );
}
