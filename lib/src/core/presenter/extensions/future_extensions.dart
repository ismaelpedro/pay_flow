import 'package:flutter/material.dart';
import '../pay_flow_app.dart';

extension FutureExtensions<T> on Future<T> {
  Future<T> onLoading() async {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (_) => PopScope(
        onPopInvoked: (value) => false,
        child: const Center(
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );

    try {
      final T result = await this;
      Navigator.pop(navigatorKey.currentContext!);
      return result;
    } catch (error) {
      Navigator.pop(navigatorKey.currentContext!);
      debugPrint(error.toString());
      rethrow;
    }
  }
}
