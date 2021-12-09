import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/user.dart';

abstract class ISaveUserUsecase {
  Future<Either<Exception, User>?> call(User user);
}
