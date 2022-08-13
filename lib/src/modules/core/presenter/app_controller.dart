import 'dart:async';
import 'package:flutter/material.dart';
import '../domain/entities/ticket_entity.dart';
import '../domain/entities/user_entity.dart';

class AppController {
  late UserEntity currentUser;
  final StreamController<Locale> locateGlobal = StreamController<Locale>();
  List<TicketEntity> tickets = <TicketEntity>[];

  Stream<Locale> setLocale(Locale locale ) {
    locateGlobal.sink.add(locale);
    return locateGlobal.stream;
  }
}
