import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "https://dummyjson.com/users";

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.post('$baseUrl$endPoint', data: data);
    return response.data;
  }
}
