import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../http.dart';

class DioHttpAdapter implements HttpClient {
  final Dio _client;
  static const Duration _defaultConnectionTimeout = Duration(seconds: 25);

  DioHttpAdapter({
    required String baseUrl,
    List<Interceptor>? interceptors,
  }) : _client = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: const {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Cache-Control': 'no-cache',
            },
          ),
        ) {
    _client.interceptors.addAll(interceptors ?? []);
    _client.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
          printRequestData: true,
          printResponseData: true,
        ),
      ),
    );
  }

  Future<HttpResponse> _handleRequest(
    HttpOptions options, {
    bool useCustomUrl = false,
  }) async {
    final String url = useCustomUrl ? options.path : _client.options.baseUrl + options.path;
    Response<dynamic> response;

    try {
      response = await _client
          .request(
            url,
            data: options.body,
            queryParameters: options.query,
            options: Options(
              method: options.method.name.toUpperCase(),
              headers: options.headers,
            ),
          )
          .timeout(_defaultConnectionTimeout);

      return HttpResponse(
        data: response.data,
        status: response.statusCode?.convertToHttpStatus() ?? HttpStatus.ok,
      );
    } on DioException catch (e) {
      return HttpResponse(
        data: e.response?.data,
        status: e.response?.statusCode?.convertToHttpStatus() ?? HttpStatus.unknown,
      );
    }
  }

  @override
  Future<HttpResponse> get(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.get,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }

  @override
  Future<HttpResponse> post(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.post,
        body: body,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }

  @override
  Future<HttpResponse> put(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.put,
        body: body,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }

  @override
  Future<HttpResponse> patch(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.patch,
        body: body,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }

  @override
  Future<HttpResponse> delete(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.delete,
        body: body,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }
}
