import 'package:pay_flow/core/domain/entities/user_entity.dart';
import 'package:pay_flow/core/infra/interfaces/datasources/i_user_datasource.dart';

class UserDatasource implements IUserDatasource {
  @override
  Future<UserEntity> getUser() async {
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser() async {
    throw UnimplementedError();
  }
}
