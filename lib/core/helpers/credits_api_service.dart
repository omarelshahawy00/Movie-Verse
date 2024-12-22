import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';

class CreditsApiService {
  final Dio dio;

  CreditsApiService(this.dio);

  getCastsData({required int movieId}) async {
    var response = await dio.get(
        '${ApiConstants.baseUrlForCredits}$movieId${ApiConstants.constCreditsUrl}${ApiConstants.apiKey}');
    return response.data;
  }

  getTrailerData({required int movieId}) async {
    var response = await dio.get(
        '${ApiConstants.baseUrlForCredits}$movieId${ApiConstants.constVideoUrl}${ApiConstants.apiKey}');
    return response.data;
  }
}
