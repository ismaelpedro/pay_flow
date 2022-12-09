import 'dart:core';

import 'http.dart';

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
  void addInterceptors(List<HttpInterceptor> interceptors);
}
