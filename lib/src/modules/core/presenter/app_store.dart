import 'package:mobx/mobx.dart';

import '../core.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  UserEntity? user;

  @observable
  List<TicketEntity> tickets = <TicketEntity>[];

  @action
  void setTickets(TicketEntity newTicket) => tickets = List<TicketEntity>.from(tickets..add(newTicket));
}
