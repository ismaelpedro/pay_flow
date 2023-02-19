import 'http.dart';

class HttpResponse {
  final HttpStatus status;
  final dynamic data;

  dynamic get body => data;

  const HttpResponse({
    required this.status,
    this.data,
  });

  factory HttpResponse.success(
    Object? data, {
    HttpStatus status = HttpStatus.ok,
  }) {
    return HttpResponse(status: status, data: data);
  }

  factory HttpResponse.empty({HttpStatus status = HttpStatus.noContent}) {
    return HttpResponse(status: status);
  }
}
