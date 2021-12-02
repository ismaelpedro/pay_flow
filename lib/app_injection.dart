import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'app_constants.dart';
import 'domain/usecases/get_ticket_from_hasura_usecase/get_ticket_from_hasura_usecase.dart';
import 'domain/usecases/get_user_from_hasura_usecase/get_user_from_hasura.dart';
import 'domain/usecases/save_ticket_in_hasura_usecase/save_ticket_in_hasura_usecase.dart';
import 'domain/usecases/save_user_in_hasura_usecase/save_user_in_hasura_usecase.dart';

class AppInjection implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HasuraConnect(AppConstants.hasuraApi,
        headers: AppConstants.hasuraHeaders));
    Get.lazyPut(() => GetUserFromHasuraUsecase(Get.find<HasuraConnect>()));
    Get.lazyPut(() => GetTicketFromHasuraUsecase(Get.find<HasuraConnect>()));
    Get.lazyPut(() => SaveUserInHasuraUsecase(Get.find<HasuraConnect>()));
    Get.lazyPut(() => SaveTicketInHasuraUsecase(Get.find<HasuraConnect>()));
  }
}
