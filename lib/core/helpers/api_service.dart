import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);
  Future<Map<String, dynamic>> getMoviesData({required String endPoint}) async {
    var response =
        await dio.get('${ApiConstants.baseUrl}$endPoint${ApiConstants.apiKey}');
    return response.data;
  }
}
