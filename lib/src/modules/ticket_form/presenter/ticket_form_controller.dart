import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow/src/modules/core/core.dart';
import 'package:uuid/uuid.dart';

part 'ticket_form_controller.g.dart';

class TicketFormController = TicketFormControllerBase
    with _$TicketFormController;

abstract class TicketFormControllerBase with Store {
    late final AppStore _appStore;
  TicketFormControllerBase(this._appStore);

  @observable
  String name = '';

  @action
  void setName(String newName) => name = newName;

  @observable
  String expirationDate = '';

  @action
  void setExpirationDate(String newDate) => expirationDate = newDate;

  @observable
  String value = '';

  @action
  void setValue(String newValue) => value = newValue;

  @observable
  String code = '';

  @action
  void setCode(String newCode) => code = newCode;

  @computed
  bool get canSaveBill =>
      name.isNotEmpty &&
      value.isNotEmpty &&
      expirationDate.isNotEmpty &&
      code.isNotEmpty;

  void onInitTicketFormPage(TicketEntity ticket) {
    String valueFormatted = ticket.value!.toCurrencyBRL();
    String dateFormatted = DateTime.parse(ticket.date!).formatDateDDMMYYYY();

    value = valueFormatted;
    expirationDate = dateFormatted.substring(0, 10);
    code = ticket.code!;
  }

  void saveBill(double value) {
    final TicketEntity newTicket = TicketEntity(
      id: const Uuid().v4(),
      name: name,
      date: expirationDate,
      code: code,
      value: value,
    );
    _appStore.setTickets(newTicket);
    Navigator.pop(navigatorKey.currentContext!);
  }
}
