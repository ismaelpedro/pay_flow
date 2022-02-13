import 'package:dartz/dartz.dart';
import 'package:pay_flow/core/domain/entities/user_entity.dart';
import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';
import 'package:pay_flow/modules/login/infra/interfaces/datasources/i_save_user_datasource.dart';

class SaveTicketDatasource implements ISaveUserDatasource {
  @override
  Future<Either<LoginException, UserEntity>> call(UserEntity user) {
    throw UnimplementedError();
  }
}
