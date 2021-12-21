import 'package:pay_flow/domain/entities/user.dart';

abstract class IUserRepository {
  Future<void> saveUser(User user);
  Future<void> getUser();
}
