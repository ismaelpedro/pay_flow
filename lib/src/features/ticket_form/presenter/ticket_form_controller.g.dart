// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TicketFormController on TicketFormControllerBase, Store {
  Computed<bool>? _$canSaveBillComputed;

  @override
  bool get canSaveBill =>
      (_$canSaveBillComputed ??= Computed<bool>(() => super.canSaveBill,
              name: 'TicketFormControllerBase.canSaveBill'))
          .value;

  late final _$nameAtom =
      Atom(name: 'TicketFormControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$expirationDateAtom =
      Atom(name: 'TicketFormControllerBase.expirationDate', context: context);

  @override
  String get expirationDate {
    _$expirationDateAtom.reportRead();
    return super.expirationDate;
  }

  @override
  set expirationDate(String value) {
    _$expirationDateAtom.reportWrite(value, super.expirationDate, () {
      super.expirationDate = value;
    });
  }

  late final _$valueAtom =
      Atom(name: 'TicketFormControllerBase.value', context: context);

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$codeAtom =
      Atom(name: 'TicketFormControllerBase.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$TicketFormControllerBaseActionController =
      ActionController(name: 'TicketFormControllerBase', context: context);

  @override
  void setName(String newName) {
    final _$actionInfo = _$TicketFormControllerBaseActionController.startAction(
        name: 'TicketFormControllerBase.setName');
    try {
      return super.setName(newName);
    } finally {
      _$TicketFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpirationDate(String newDate) {
    final _$actionInfo = _$TicketFormControllerBaseActionController.startAction(
        name: 'TicketFormControllerBase.setExpirationDate');
    try {
      return super.setExpirationDate(newDate);
    } finally {
      _$TicketFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue(String newValue) {
    final _$actionInfo = _$TicketFormControllerBaseActionController.startAction(
        name: 'TicketFormControllerBase.setValue');
    try {
      return super.setValue(newValue);
    } finally {
      _$TicketFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String newCode) {
    final _$actionInfo = _$TicketFormControllerBaseActionController.startAction(
        name: 'TicketFormControllerBase.setCode');
    try {
      return super.setCode(newCode);
    } finally {
      _$TicketFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
expirationDate: ${expirationDate},
value: ${value},
code: ${code},
canSaveBill: ${canSaveBill}
    ''';
  }
}
