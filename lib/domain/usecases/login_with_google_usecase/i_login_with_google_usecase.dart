import 'package:dartz/dartz.dart';
import 'package:pay_flow/infra/dtos/user_dto.dart';

abstract class ILoginWithGoogleUsecase {
  Future<Either<Exception, UserDto>?> call();
}
