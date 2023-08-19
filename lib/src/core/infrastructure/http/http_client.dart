class HttpResponse {
  final HttpStatus status;
  final dynamic data;

  const HttpResponse({
    required this.status,
    this.data,
  });
}

class HttpOptions {
  final String path;
  final HttpMethod method;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? query;

  const HttpOptions({
    required this.path,
    required this.method,
    this.body,
    this.headers,
    this.query,
  });
}

extension IntToHttpStatusEnum on int {
  HttpStatus convertToHttpStatus() {
    const statusMap = {
      200: HttpStatus.ok,
      201: HttpStatus.created,
      202: HttpStatus.accepted,
      204: HttpStatus.noContent,
      206: HttpStatus.partialContent,
      400: HttpStatus.badRequest,
      401: HttpStatus.unauthorized,
      403: HttpStatus.forbidden,
      404: HttpStatus.notFound,
      405: HttpStatus.methodNotAllowed,
      406: HttpStatus.notAcceptable,
      408: HttpStatus.timeout,
      409: HttpStatus.conflict,
      410: HttpStatus.gone,
      412: HttpStatus.preconditionFailed,
      415: HttpStatus.unsupportedMediaType,
      429: HttpStatus.tooManyRequests,
      500: HttpStatus.internalServerError,
      501: HttpStatus.notImplemented,
      502: HttpStatus.badGateway,
      503: HttpStatus.serviceUnavailable,
      504: HttpStatus.gatewayTimeout,
    };
    return statusMap[this] ?? HttpStatus.unknown;
  }
}

enum HttpMethod { delete, get, put, post, patch }

enum HttpStatus {
  ok(200),
  created(201),
  accepted(202),
  noContent(204),
  partialContent(206),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  methodNotAllowed(405),
  notAcceptable(406),
  timeout(408),
  conflict(409),
  gone(410),
  preconditionFailed(412),
  unsupportedMediaType(415),
  tooManyRequests(429),
  internalServerError(500),
  notImplemented(501),
  badGateway(502),
  serviceUnavailable(503),
  gatewayTimeout(504),
  unknown(0);

  final int code;
  const HttpStatus(this.code);
}

abstract class HttpClient {
  Future<HttpResponse> get(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
  });

  Future<HttpResponse> post(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  });

  Future<HttpResponse> put(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  });

  Future<HttpResponse> patch(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  });

  Future<HttpResponse> delete(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  });
}
