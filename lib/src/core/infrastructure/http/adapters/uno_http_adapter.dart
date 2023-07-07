import 'dart:async';

import 'package:uno/uno.dart';

import '../http.dart';

class UnoHttpAdapter implements HttpClient {
  final Uno _client;
  static const Duration _defaultConnectionTimeout = Duration(seconds: 30);

  UnoHttpAdapter({
    required String baseUrl,
  }) : _client = Uno(
          baseURL: baseUrl,
          timeout: _defaultConnectionTimeout,
          headers: const {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Cache-Control': 'no-cache',
          },
        );

  Future<HttpResponse> _handleRequest(
    HttpOptions options, {
    bool useCustomUrl = false,
  }) async {
    final String url = useCustomUrl ? options.path : _client.baseURL + options.path;

    try {
      final Response response = await _client.request(
        Request(
          uri: Uri.parse(url),
          method: options.method.name.toUpperCase(),
          headers: options.headers?.map((k, v) => MapEntry(k, v.toString())) ?? {},
          timeout: _defaultConnectionTimeout,
        ),
      );

      return HttpResponse(
        data: response.data,
        status: response.status.convertToHttpStatus(),
      );
    } catch (e) {
      return HttpResponse(
        data: e.toString(),
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
    Map<String, dynamic>? data,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.post,
        data: data,
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
    Map<String, dynamic>? data,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.put,
        data: data,
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
    Map<String, dynamic>? data,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.patch,
        data: data,
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
    Map<String, dynamic>? data,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.delete,
        data: data,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }
}
