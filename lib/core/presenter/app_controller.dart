import 'dart:async';

import 'package:flutter/material.dart';

import '../domain/entities/ticket_entity.dart';
import '../domain/entities/user_entity.dart';

class AppController {
  late UserEntity currentUser;
  final locateGlobal = StreamController<Locale>();
  var tickets = <TicketEntity>[];

  Stream<Locale> setLocale(Locale locale) {
    locateGlobal.sink.add(locale);
    return locateGlobal.stream;
  }
}
