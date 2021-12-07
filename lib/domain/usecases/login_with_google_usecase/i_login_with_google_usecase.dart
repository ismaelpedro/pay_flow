import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/user_entity.dart';

abstract class ILoginWithGoogleUsecase {
  Future<Either<Exception, UserEntity>?> call();
}
