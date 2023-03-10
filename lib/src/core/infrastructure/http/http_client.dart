import 'dart:core';

import 'http.dart';

enum HttpMethod { delete, get, put, post, patch }

enum HttpStatus {
  ok(200),
  created(201),
  noContent(204),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  timeout(408),
  internalServerError(500),
  gatewayTimeout(504);

  final int code;
  const HttpStatus(this.code);
}

abstract class HttpClient {
  Future<HttpResponse> get(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    Duration? timeout,
  });

  Future<HttpResponse> post(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  Future<HttpResponse> put(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  Future<HttpResponse> patch(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  Future<HttpResponse> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  /// Adds a custom interceptor to handle requests, responses and errors.
  /// If there's more than one interceptor, they'll be executed sequentially.
  // void addInterceptors(List<HttpInterceptor> interceptors);
}
