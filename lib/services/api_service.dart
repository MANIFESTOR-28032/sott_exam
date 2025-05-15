import 'package:dio/dio.dart';
import '../models/property.dart';

class ApiService {
  final Dio _dio;
  
  ApiService() : _dio = Dio(BaseOptions(
    baseUrl: const String.fromEnvironment('API_BASE_URL', defaultValue: 'http://172.19.208.1:8888/api/v1'),
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  Future<List<Property>> getProperties() async {
    try {
      final response = await _dio.get('/real-estates');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        try {
          return data.map((json) => Property.fromJson(json)).toList();
        } catch (e) {
          throw Exception('Ошибка парсинга данных: $e');
        }
      }
      throw Exception('Ошибка загрузки данных: ${response.statusCode}');
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Превышено время ожидания соединения');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Превышено время ожидания ответа');
      }
      throw Exception('Ошибка сети: ${e.message}');
    } catch (e) {
      throw Exception('Неизвестная ошибка: $e');
    }
  }

  Future<List<dynamic>> getPosts() async {
    try {
      final response = await _dio.get('/posts');
      if (response.statusCode == 200) {
        return response.data as List<dynamic>;
      }
      throw Exception('Ошибка загрузки постов: ${response.statusCode}');
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Превышено время ожидания соединения');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Превышено время ожидания ответа');
      }
      throw Exception('Ошибка сети: ${e.message}');
    } catch (e) {
      throw Exception('Неизвестная ошибка: $e');
    }
  }
} 