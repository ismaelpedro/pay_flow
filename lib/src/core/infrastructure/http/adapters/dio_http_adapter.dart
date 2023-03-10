import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../http.dart';

class DioHttpAdapter implements HttpClient {
  final Dio client;
  final String baseUrl;
  final Map<String, String>? headers;
  final List<Interceptor> interceptors = <Interceptor>[];

  DioHttpAdapter({
    required this.client,
    required this.baseUrl,
    this.headers = _defaultHeaders,
  }) {
    client
      ..options.baseUrl = baseUrl
      ..options.headers = _defaultHeaders
      ..interceptors.addAll(<Interceptor>[
        PrettyDioLogger(),
      ]);
  }

  static const Duration _defaultConnectionTimeout = Duration(seconds: 30);
  static const Map<String, String> _defaultHeaders = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Cache-Control': 'no-cache',
  };

  Future<HttpResponse> _handleRequest(HttpOptions httpOptions) async {
    Response<dynamic>? response;
    final String url = baseUrl + httpOptions.path;

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
        status: response.statusCode?.convertToHttpStatus() ?? HttpStatus.internalServerError,
      );
    } on DioError catch (e) {
      return HttpResponse(
        data: e.response?.data,
        status: e.response?.statusCode?.convertToHttpStatus() ?? HttpStatus.internalServerError,
      );
    } on TimeoutException {
      return const HttpResponse(
        data: 'Requisição demorou demais',
        status: HttpStatus.timeout,
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
    Map<String, String>? headers,
    Map<String, String>? query,
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.get,
        headers: headers,
        timeout: timeout,
        query: query,
      ),
    );
  }

  @override
  Future<HttpResponse> post(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
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
    );
  }

  @override
  Future<HttpResponse> put(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
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
    );
  }

  @override
  Future<HttpResponse> patch(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
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
    );
  }

  @override
  Future<HttpResponse> delete(
    String url, {
    Map<String, String>? headers,
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
      ),
    );
  }
}
