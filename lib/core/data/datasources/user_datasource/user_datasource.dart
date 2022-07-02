import '../../../domain/entities/user_entity.dart';
import 'i_user_datasource.dart';

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
