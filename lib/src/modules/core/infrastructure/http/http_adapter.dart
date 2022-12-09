import 'dart:async';

import 'package:dio/dio.dart';

import 'extensions/int_to_http_status_enum.dart';
import 'http.dart';

class HttpAdapter implements HttpClient {
  final Dio client;
  final String baseUrl;
  final Map<String, String> headers;
  final List<HttpInterceptor> interceptors = <HttpInterceptor>[];

  HttpAdapter({
    required this.client,
    required this.baseUrl,
    this.headers = _defaultHeaders,
  });

  static const Duration _defaultConnectionTimeout = Duration(seconds: 10);

  static const Map<String, String> _defaultHeaders = <String, String>{
    'content-type': 'application/json; charset=utf-8',
    'accept': 'application/json',
  };

  Future<HttpResponse> _handleRequest(HttpOptions httpOptions) async {
    late Response<dynamic> response;
    final String url = baseUrl + httpOptions.path;

    switch (httpOptions.method) {
      case HttpMethod.get:
        response = await client.get(
          url,
          queryParameters: httpOptions.query ?? <String, String>{},
          options: Options(
            headers: httpOptions.headers ?? _defaultHeaders,
            sendTimeout: _defaultConnectionTimeout.inSeconds,
          ),
        );
        break;
      case HttpMethod.post:
        response = await client.post(
          url,
          data: httpOptions.data,
          queryParameters: httpOptions.query ?? <String, String>{},
          options: Options(
            headers: httpOptions.headers ?? _defaultHeaders,
            sendTimeout: _defaultConnectionTimeout.inSeconds,
          ),
        );
        break;
      case HttpMethod.put:
        response = await client.put(
          url,
          data: httpOptions.data,
          queryParameters: httpOptions.query ?? <String, String>{},
          options: Options(
            headers: httpOptions.headers ?? _defaultHeaders,
            sendTimeout: _defaultConnectionTimeout.inSeconds,
          ),
        );
        break;
      case HttpMethod.patch:
        response = await client.patch(
          url,
          data: httpOptions.data,
          queryParameters: httpOptions.query ?? <String, String>{},
          options: Options(
            headers: httpOptions.headers ?? _defaultHeaders,
            sendTimeout: _defaultConnectionTimeout.inSeconds,
          ),
        );
        break;
      case HttpMethod.delete:
        response = await client.delete(
          url,
          data: httpOptions.data,
          queryParameters: httpOptions.query ?? <String, String>{},
          options: Options(
            headers: httpOptions.headers ?? _defaultHeaders,
            sendTimeout: _defaultConnectionTimeout.inSeconds,
          ),
        );
        break;
    }

    return HttpResponse(
      data: response.data,
      status: response.statusCode!.convertToHttpStatus(),
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
        method: HttpMethod.patch,
        data: body,
        headers: headers,
        timeout: timeout,
        query: query,
      ),
    );
  }

  @override
  void addInterceptors(List<HttpInterceptor> interceptors) {
    this.interceptors.addAll(interceptors);
  }
}
