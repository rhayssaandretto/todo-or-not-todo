abstract class IDioService {
  Future<String?> restRequest({
    required String url,
    required DioMethodsEnum method,
    Map<String, dynamic>? headers,
    dynamic body,
    Map<String, dynamic>? query,
  });
}

enum DioMethodsEnum {
  post('POST'),
  get('GET'),
  put('PUT'),
  delete('DELETE'),
  patch('PATCH');

  final String str;
  const DioMethodsEnum(this.str);
}
