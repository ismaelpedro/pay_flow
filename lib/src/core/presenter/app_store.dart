import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow/src/core/infrastructure/google_sign_in/google_sign_in_adapter.dart';

import '../core.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  final GoogleSignInAdapter _googleSignInAdapter;
  AppStoreBase(this._googleSignInAdapter);

  @observable
  UserEntity? user;

  @observable
  List<TicketEntity> tickets = <TicketEntity>[];

  @action
  void setTickets(TicketEntity newTicket) =>
      tickets = List<TicketEntity>.from(tickets..insert(0, newTicket));

  Future<void> logOut() async {
    await _googleSignInAdapter.signOut();
    Navigator.pushNamedAndRemoveUntil(
      navigatorKey.currentContext!,
      Routes.login,
      (_) => false,
    );
  }
}
