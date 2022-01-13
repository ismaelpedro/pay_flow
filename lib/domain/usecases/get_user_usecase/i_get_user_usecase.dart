import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/user.dart';
import 'package:pay_flow/domain/exceptions/hasura_exception.dart';

abstract class IGetUserUsecase {
  Future<Either<HasuraException, User>> call();
}
