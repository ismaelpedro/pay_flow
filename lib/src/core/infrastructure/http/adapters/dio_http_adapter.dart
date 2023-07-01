import 'dart:async';

import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../http.dart';

class DioHttpAdapter implements HttpClient {
  final Dio client;

  static const Duration _defaultConnectionTimeout = Duration(seconds: 30);
  static const Map<String, String> _defaultHeaders = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Cache-Control': 'no-cache',
  };

  DioHttpAdapter({
    required this.client,
  }) {
    client
      ..options.baseUrl = client.options.baseUrl
      ..options.headers = _defaultHeaders
      ..interceptors.addAll(<Interceptor>[
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseMessage: true,
            printRequestData: true,
            printResponseData: true,
          ),
        ),
      ]);
  }

  Future<HttpResponse> _handleRequest(
    HttpOptions httpOptions, {
    bool useCustomUrl = false,
  }) async {
    Response<dynamic>? response;
    final String url = useCustomUrl ? httpOptions.path : client.options.baseUrl + httpOptions.path;

    try {
      switch (httpOptions.method) {
        case HttpMethod.get:
          response = await client
              .get(
                url,
                queryParameters: httpOptions.query,
                options: Options(headers: httpOptions.headers),
              )
              .timeout(_defaultConnectionTimeout);
          break;
        case HttpMethod.post:
          response = await client
              .post(
                url,
                data: httpOptions.data,
                queryParameters: httpOptions.query,
                options: Options(headers: httpOptions.headers),
              )
              .timeout(_defaultConnectionTimeout);
          break;
        case HttpMethod.put:
          response = await client
              .put(
                url,
                data: httpOptions.data,
                queryParameters: httpOptions.query,
                options: Options(headers: httpOptions.headers),
              )
              .timeout(_defaultConnectionTimeout);
          break;
        case HttpMethod.patch:
          response = await client
              .patch(
                url,
                data: httpOptions.data,
                queryParameters: httpOptions.query,
                options: Options(headers: httpOptions.headers),
              )
              .timeout(_defaultConnectionTimeout);
          break;
        case HttpMethod.delete:
          response = await client
              .delete(
                url,
                data: httpOptions.data,
                queryParameters: httpOptions.query,
                options: Options(
                  headers: httpOptions.headers,
                ),
              )
              .timeout(_defaultConnectionTimeout);
          break;
      }

      return HttpResponse(
        data: response.data,
        status: response.statusCode?.convertToHttpStatus() ?? HttpStatus.ok,
      );
    } catch (e) {
      return const HttpResponse(
        data: 'Erro inesperado',
        status: HttpStatus.internalServerError,
      );
    }
  }

  @override
  Future<HttpResponse> get(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.get,
        headers: headers,
        query: query,
        timeout: timeout,
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
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.post,
        data: body,
        headers: headers,
        timeout: timeout,
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
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.put,
        data: body,
        headers: headers,
        timeout: timeout,
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
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.patch,
        data: body,
        headers: headers,
        timeout: timeout,
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
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.delete,
        data: body,
        headers: headers,
        timeout: timeout,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }
}
