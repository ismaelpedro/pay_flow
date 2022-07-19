import 'package:flutter/material.dart';

import '../../../../core/presenter/navigation/routes.dart';
import '../../domain/interfaces/services/i_google_sign_in_service.dart';
import '../../domain/repositories/i_login_with_google_repository.dart';

class LoginWithGoogleRepository implements ILoginWithGoogleRepository {
  final IGoogleSignInService _service;
  LoginWithGoogleRepository(this._service);

  @override
  Future<void> call(BuildContext context) async {
    final user = await _service.signIn();
    if (user != null) {
      Navigator.pushNamed(
        context,
        Routes.home,
        arguments: user,
      );
    }
  }
}
