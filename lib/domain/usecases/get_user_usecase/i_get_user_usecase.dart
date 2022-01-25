import 'package:dartz/dartz.dart';
import 'package:pay_flow/domain/entities/user_entity.dart';
import 'package:pay_flow/domain/exceptions/hasura_exception.dart';

abstract class IGetUserUsecase {
  Future<Either<HasuraException, UserEntity>> call();
}
