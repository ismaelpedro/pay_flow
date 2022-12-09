import 'http.dart';

class HttpOptions {
  final String path;
  final HttpMethod method;
  final String? url;
  final Map<String, dynamic>? data;
  final Map<String, String>? headers;
  final Map<String, String>? query;
  final Duration? timeout;

  const HttpOptions({
    required this.path,
    required this.method,
    this.url,
    this.data,
    this.headers,
    this.query,
    this.timeout,
  });
}
