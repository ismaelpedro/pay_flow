import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../home/presenter/home_controller.dart';
import '../../../login/domain/usecases/login_with_google_usecase.dart';
import '../../../login/presenter/login_controller.dart';
import '../../core.dart';
import '../google_sign_in/google_sign_in_adapter.dart';

final GetIt serviceLocator = GetIt.instance;

void setUpInjections() {
  ///[Packages]
  serviceLocator.registerSingleton(GoogleSignIn());

  /// [DataSources]
  /// Consist of remote and local Data Sources. Remote Data Source will perform HTTP requests on the API. While local Data Source will cache or persist data.

  /// [Repositories]
  /// Actual implementations of the repositories in the Domain layer. Repositories are responsible to coordinate data from the different Data Sources.

  /// [Adapters]
  serviceLocator.registerSingleton(GoogleSignInAdapter(serviceLocator.get()));

  /// [Usecases]
  /// Application-specific business rules
  serviceLocator
      .registerSingleton(LoginWithGoogleUsecase(serviceLocator.get()));

  // Controllers
  serviceLocator.registerSingleton(LoginController(serviceLocator.get()));
  serviceLocator.registerSingleton(HomeController());
  serviceLocator.registerSingleton(AppController());

  debugPrint('Set Up All Injections!');
}
