enum HttpMethod { delete, get, put, post, patch }

enum HttpStatus {
  ok(200),
  created(201),
  noContent(204),
  badRequest(400),
  unauthorized(401),
  notFound(404),
  internalServerError(500),
  gatewayTimeout(504);

  final int code;
  const HttpStatus(this.code);
}
