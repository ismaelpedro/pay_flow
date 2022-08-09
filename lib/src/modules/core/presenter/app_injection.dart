import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../home/presenter/home_controller.dart';
import '../../login/domain/interfaces/services/google_sign_in_service.dart';
import '../../login/domain/usecases/login_with_google_usecase.dart';
import '../../login/presenter/login_controller.dart';
import 'app_controller.dart';

class AppInjection {
  static GetIt getIt = GetIt.instance;

  static void setUp() {
    getIt.registerLazySingleton(() => AppController());

    getIt.registerFactory(() => GoogleSignIn());
    getIt.registerFactory(() => GoogleSignInService(getIt.get<GoogleSignIn>()));

    getIt.registerFactory(
      () => LoginWithGoogleUsecase(getIt.get<GoogleSignInService>()),
    );
    getIt.registerFactory(() => HomeController());
    getIt.registerFactory(
      () => LoginController(getIt.get<LoginWithGoogleUsecase>()),
    );
  }
}
