import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // علشان نستخدم debugPrint بدل print

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with API server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet connection');

      case DioExceptionType.unknown:
        return ServerFailure('Oops! There was an error , please try again.');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    debugPrint('API Error Response ($statusCode): $response');

    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with the server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      final message =
          // response?['error']?['message'] ??
          // response?['error'] ??
          // response?['message'] ??
          'Unknown error occurred';
      return ServerFailure(message);
    } else {
      return ServerFailure('There was an Error  , please try again');
    }
  }
}
