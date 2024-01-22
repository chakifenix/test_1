import 'dart:async';
import 'package:dio/dio.dart';

class NetworkService {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 30),
  ));

  Future<dynamic> get(
      {required String url, Map<String, dynamic>? parameters}) async {
    Map<String, dynamic> headersData = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final response = await dio.get(url,
          options: Options(headers: headersData), queryParameters: parameters);
      return apiAnswerGenerator(response);
    } catch (e) {
      return errorAnswerGenerator(e);
    }
  }

  dynamic apiAnswerGenerator(Response<dynamic> response) {
    if (response.statusCode == 200) {
      return response;
    } else {
      final Map<String, dynamic> answerMap = response.data;

      if (answerMap.containsKey('message')) {
        return answerMap['message'];
      } else {
        return 'Неизвестная ошибка';
      }
    }
  }

  String errorAnswerGenerator(dynamic err) {
    if (err is DioException) {
      return _handleError(err);
    } else {
      return 'Неизвестная ошибка';
    }
  }

  String _handleError(DioException error) {
    if (error.response == null) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Ошибка соеденения с сервером';
        case DioExceptionType.sendTimeout:
          return 'Время загрузки истекло';
        case DioExceptionType.receiveTimeout:
          return 'Время загрузки истекло';
        case DioExceptionType.badResponse:
          return 'Unknown error';
        case DioExceptionType.cancel:
          return 'Отмена запроса';
        default:
          return 'Неизвестная ошибка';
      }
    } else if (error.response!.statusCode == 401) {
      return error.response!.data['message'];
    } else {
      return 'Введите ИИН';
    }
  }
}
