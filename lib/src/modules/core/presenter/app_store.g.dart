// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppStoreBase, Store {
  Computed<FutureStatus>? _$ticketsStatusComputed;

  @override
  FutureStatus get ticketsStatus => (_$ticketsStatusComputed ??=
          Computed<FutureStatus>(() => super.ticketsStatus,
              name: 'AppStoreBase.ticketsStatus'))
      .value;

  late final _$userAtom = Atom(name: 'AppStoreBase.user', context: context);

  @override
  UserEntity? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserEntity? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$ticketsAtom =
      Atom(name: 'AppStoreBase.tickets', context: context);

  @override
  ObservableFuture<List<TicketEntity>> get tickets {
    _$ticketsAtom.reportRead();
    return super.tickets;
  }

  @override
  set tickets(ObservableFuture<List<TicketEntity>> value) {
    _$ticketsAtom.reportWrite(value, super.tickets, () {
      super.tickets = value;
    });
  }

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  void setTickets(ObservableFuture<List<TicketEntity>> newTickets) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setTickets');
    try {
      return super.setTickets(newTickets);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
tickets: ${tickets},
ticketsStatus: ${ticketsStatus}
    ''';
  }
}
