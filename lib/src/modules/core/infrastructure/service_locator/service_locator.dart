import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/src/modules/core/utils.dart';

import '../../../home/presenter/home_store.dart';
import '../../../login/domain/usecases/login_with_google_usecase.dart';
import '../../../login/presenter/login_store.dart';
import '../../core.dart';
import '../../services/firebase_messaging_service.dart';
import '../../services/notification_service.dart';
import '../google_sign_in/google_sign_in_adapter.dart';
import '../http/http.dart';

final GetIt serviceLocator = GetIt.instance;
GetIt get _i => serviceLocator;

void setUpInjections() {
  ///[Packages]
  /// External Packages
  serviceLocator.registerLazySingleton(() => Utils());
  serviceLocator.registerFactory(() => GoogleSignIn());
  serviceLocator.registerSingleton(
    HttpAdapter(
      baseUrl: 'https://localhost',
      client: Dio(),
    )..addInterceptors(<HttpInterceptor>[]),
  );

  /// [DataSources]
  /// Consist of remote and local Data Sources. Remote Data Source will perform HTTP requests on the API. While local Data Source will cache or persist data.

  /// [Repositories]
  /// Actual implementations of the repositories in the Domain layer. Repositories are responsible to coordinate data from the different Data Sources.

  /// [Adapters]
  /// Convert the interface of a class into another interface clients expect. Adapter lets classes work together that wouldn't otherwise because of incompatible interfaces.
  serviceLocator.registerFactory(() => GoogleSignInAdapter(_i()));
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

  debugPrint('-- Set Up All Injections!');
}
