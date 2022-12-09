import '../http.dart';

extension IntToHttpStatusEnum on int {
  HttpStatus convertToHttpStatus() {
    switch (this) {
      case 200:
        return HttpStatus.ok;
      case 201:
        return HttpStatus.created;
      case 204:
        return HttpStatus.noContent;
      case 400:
        return HttpStatus.badRequest;
      case 401:
        return HttpStatus.unauthorized;
      case 404:
        return HttpStatus.notFound;
      case 500:
        return HttpStatus.internalServerError;
      case 504:
        return HttpStatus.gatewayTimeout;
      default:
        return HttpStatus.ok;
    }
  }
}
