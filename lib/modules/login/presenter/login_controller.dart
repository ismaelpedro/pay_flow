import 'package:get_it/get_it.dart';

import '../../../core/presenter/presenter.dart';
import '../domain/usecases/login_with_google_usecase.dart';

class LoginController {
  final LoginWithGoogleUsecase _loginUsecase;
  LoginController(this._loginUsecase);

  Future<void> loginWithGoogle() async {
    final user = await _loginUsecase();
    if (user != null) {
      GetIt.I<AppController>().currentUser = user;
    }
  }
}
