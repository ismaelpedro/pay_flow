import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../core.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  late UserEntity currentUser;
  final StreamController<Locale> locateGlobal = StreamController<Locale>();
  List<TicketEntity> tickets = <TicketEntity>[];

  Stream<Locale> setLocale(Locale locale) {
    locateGlobal.sink.add(locale);
    return locateGlobal.stream;
  }
}
