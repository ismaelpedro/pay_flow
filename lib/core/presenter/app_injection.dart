import 'package:get_it/get_it.dart';
import '../../modules/login/domain/usecases/login_usecase.dart';
import 'app_controller.dart';
import '../../modules/login/presenter/login_controller.dart';

class AppInjection {
  static GetIt getIt = GetIt.instance;

  static void setUp() {
    getIt.registerLazySingleton(() => AppController());
    getIt.registerFactory(() => LoginUsecase());
    getIt.registerFactory(() => LoginController());
  }
}
