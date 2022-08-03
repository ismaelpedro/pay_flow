import 'package:flutter/material.dart';

import '../../../../core/domain/entities/user_entity.dart';
import '../../domain/interfaces/services/i_google_sign_in_service.dart';
import '../../domain/repositories/i_login_with_google_repository.dart';

class LoginWithGoogleRepository implements ILoginWithGoogleRepository {
  final IGoogleSignInService _service;
  LoginWithGoogleRepository(this._service);

  @override
  Future<UserEntity?> call(BuildContext context) async {
    UserEntity? user = await _service.signIn();
    return user;
  }
}
