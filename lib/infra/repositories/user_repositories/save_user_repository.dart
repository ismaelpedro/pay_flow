import 'dart:developer';
import 'package:pay_flow/domain/repositories/user_repositories/i_save_user_respository.dart';
import 'package:pay_flow/infra/repositories/services/hasura/i_hasura_service.dart';

class SaveUserRepository implements ISaveUserRepository {
  IHasuraService service;
  SaveUserRepository(this.service);

  @override
  Future<void> call(String mutation) async {
    try {
      await service.mutation(mutation);
    } catch (e) {
      log('$e');
    }
  }
}
