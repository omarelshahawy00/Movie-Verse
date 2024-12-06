import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/helpers/api_service.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';

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
}