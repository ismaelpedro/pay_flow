import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/user.dart';

abstract class ILoginWithGoogleUseCase {
  Future<Either<Exception, User>> call();
}
