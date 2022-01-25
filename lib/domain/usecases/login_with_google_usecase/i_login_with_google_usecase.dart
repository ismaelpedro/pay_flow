import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/user_entity.dart';
import 'package:pay_flow/domain/exceptions/login_exception.dart';

abstract class ILoginWithGoogleUsecase {
  Future<Either<LoginException, UserEntity>> call();
}
