import 'package:mobx/mobx.dart';

import '../core.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  UserEntity? user;

  @observable
  ObservableFuture<List<TicketEntity>> tickets =
      ObservableFuture<List<TicketEntity>>.value(<TicketEntity>[]);

  @action
  void setTickets(ObservableFuture<List<TicketEntity>> newTickets) =>
      tickets = newTickets;

  @computed
  FutureStatus get ticketsStatus => tickets.status;
}
