import 'package:get/get.dart';

import 'package:pay_flow/domain/usecases/get_ticket_from_hasura_usecase/i_get_ticket_from_hasura_usecase.dart';

class HomeController extends GetxController {
  final IGetTicketFromHasuraUsecase _getTickerFromHasuraUsecase;
  HomeController(this._getTickerFromHasuraUsecase);
}
