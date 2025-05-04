import 'dart:convert';
import 'dart:io';

import '../../../app_imports.dart';

class DioServiceImp implements IDioService {
  final Dio _dio;

  const DioServiceImp(this._dio);

  @override
  Future<String?> restRequest({
    required String url,
    required DioMethodsEnum method,
    Map<String, dynamic>? headers,
    dynamic body,
    Map<String, dynamic>? query,
  }) async {
    try {
      final mergedHeaders = headers ?? {};
      _dio.options.headers.addAll(mergedHeaders);

      final response = await _dio.request(
        '${_dio.options.baseUrl}$url',
        options: Options(method: method.str),
        data: body,
        queryParameters: query,
      );

      final data = response.data;

      if (data is Map && data.containsKey('errors')) {
        final errors = data['errors'];
        final errorMessage = (errors is List && errors.isNotEmpty)
            ? errors.first['message'] ?? 'API returned an unknown error'
            : 'API returned errors';

        throw DataSourceUnknownError(
          exception: data['errors'],
          stackTrace: StackTrace.current,
          message: errorMessage,
        );
      }

      return data != null ? jsonEncode(data) : null;
    } on DioException catch (e, s) {
      if (e.error is SocketException) {
        throw DataSourceConnectionError(exception: e, stackTrace: s);
      }

      if (e.response?.statusCode == 401) {
        throw DataSourceUnauthorizedError(exception: e, stackTrace: s);
      }

      throw DataSourceUnknownError(
        exception: e,
        message: e.message,
        stackTrace: s,
        statusCode: e.response?.statusCode,
      );
    } catch (e, s) {
      throw DataSourceUnknownError(exception: e, stackTrace: s);
    }
  }
}

class DioFactory {
  static Dio create({
    List<Interceptor> interceptors = const [],
  }) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
        validateStatus: (status) =>
            status != null && status >= 200 && status < 300,
      ),
    );

    dio.options.headers.addAll({
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    });

    dio.interceptors.addAll([
      CurlLoggerDioInterceptor(printOnSuccess: true),
      ...interceptors,
    ]);

    return dio;
  }
}
