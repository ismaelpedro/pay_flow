import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/user_entity.dart';

abstract class IGetUserUsecase {
  Future<Either<Exception, UserEntity?>> call(String id);
}
