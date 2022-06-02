import 'package:get_it/get_it.dart';
import 'package:pay_flow/core/presenter/app_controller.dart';
import 'package:pay_flow/modules/login/presenter/login_controller.dart';

class AppInjection {
  static GetIt getIt = GetIt.instance;

  static void setUp() {
    getIt.registerLazySingleton(() => AppController());
    getIt.registerFactory(() => LoginController());
  }
}
