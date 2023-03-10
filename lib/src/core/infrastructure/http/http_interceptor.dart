import 'dart:async';

import 'http.dart';

class HttpInterceptor {
  FutureOr<HttpResponse> onResponse(HttpResponse response) {
    return response;
  }

  void onError(Exception exception) {}

  FutureOr<HttpOptions> onRequest(HttpOptions request, HttpClient client) {
    return request;
  }
}
