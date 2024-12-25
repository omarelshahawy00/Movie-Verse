import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/features/actor_details/data/model/actor_model.dart';

class CreditsApiService {
  final Dio dio;

  CreditsApiService(this.dio);

  getCastsData({required int movieId}) async {
    Response response = await dio.get(
        '${ApiConstants.baseUrlForCredits}$movieId${ApiConstants.constCreditsUrl}${ApiConstants.apiKey}');
    return response.data;
  }

  getTrailerData({required int movieId}) async {
    Response response = await dio.get(
        '${ApiConstants.baseUrlForCredits}$movieId${ApiConstants.constVideoUrl}${ApiConstants.apiKey}');
    return response.data;
  }

  Future<Map<String, dynamic>> getPersonData({required int? personId}) async {
    Response response = await dio.get(
        '${ApiConstants.basePresonUrl}$personId?language=en-US${ApiConstants.apiKey}');
    return response.data;
  }

  Future<Map<String, dynamic>> getPersonMovies({required int? personId}) async {
    Response response = await dio.get(
        '${ApiConstants.basePresonUrl}$personId/combined_credits?language=en-US${ApiConstants.apiKey}');
    return response.data;
  }

  Future<Map<String, dynamic>> getSearchedMovies(
      {required String query}) async {
    Response response = await dio.get(
        '${ApiConstants.searchBaseUrl}$query&language=en-US${ApiConstants.apiKey}');
    return response.data;
  }
}
