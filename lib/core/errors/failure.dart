import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailer extends Failure {
  ServerFailer(super.errMessage);

  factory ServerFailer.fromDioError(DioException dioError) {
    print("Error Type: ${dioError.type}"); // Logs the DioException type
    print("Error Message: ${dioError.message}"); // Logs the error message
    print(
        "Error Response: ${dioError.response?.data}"); // Logs the error response if available

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailer('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailer('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailer('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailer('Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailer.fromResponse(
            dioError.response?.statusCode ?? 0, dioError.response?.data);
      case DioExceptionType.cancel:
        return ServerFailer('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailer(
            'There is an error while trying to make a connection');
      case DioExceptionType.unknown:
        // Check if it's a socket error or another unknown issue
        if (dioError.message?.contains('SocketException') ?? false) {
          return ServerFailer('No internet connection');
        }
        // Return detailed message for other unknown cases
        return ServerFailer(
            dioError.message ?? 'Unexpected error, please try again!');
      default:
        return ServerFailer('Oops, there was an error. Try again later');
    }
  }

  factory ServerFailer.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 404) {
      return ServerFailer(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailer('Your request not found please try again later');
    } else if (statusCode == 500) {
      return ServerFailer('Internal server error please try later');
    } else {
      return ServerFailer('Oops there was an error try again later');
    }
  }
}
