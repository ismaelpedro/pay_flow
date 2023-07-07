import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/home/presenter/home_store.dart';
import '../../../features/login/domain/usecases/login_with_google_usecase.dart';
import '../../../features/login/presenter/login_store.dart';
import '../../core.dart';

final GetIt serviceLocator = GetIt.instance;
GetIt get _i => serviceLocator;

void setUpInjections() {
  ///[Packages]
  /// External Packages
  serviceLocator.registerLazySingleton(() => Utilities());

  /// [DataSources]
  /// Consist of remote and local Data Sources. Remote Data Source will perform HTTP requests on the API. While local Data Source will cache or persist data.

  /// [Repositories]
  /// Actual implementations of the repositories in the Domain layer. Repositories are responsible to coordinate data from the different Data Sources.
  ///
  /// [Adapters]
  /// Convert the interface of a class into another interface clients expect. Adapter lets classes work together that wouldn't otherwise because of incompatible interfaces.
  serviceLocator.registerLazySingleton(() => DioHttpAdapter(baseUrl: 'https://api.github.com'));
  serviceLocator.registerFactory(() => GoogleSignInAdapter(GoogleSignIn()));
  serviceLocator.registerFactory(() => NotificationService());
  serviceLocator.registerLazySingleton(() => FirebaseMessagingService(_i()));

  /// [Usecases]
  /// Application-specific business rules
  serviceLocator.registerFactory(() => LoginWithGoogleUsecase(_i()));

  /// [Controllers]
  /// Controllers are a means to give control to the parent widget over its child state.
  serviceLocator.registerFactory(() => LoginStore(_i(), _i(), _i()));
  serviceLocator.registerFactory(() => HomeStore());
  serviceLocator.registerLazySingleton(() => AppStore(_i()));

  log('-- Configured all injections!');
}
