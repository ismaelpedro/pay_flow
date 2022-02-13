import 'package:dartz/dartz.dart';

import '../../entities/user_entity.dart';

abstract class ISaveUserUsecase {
  Future<Either<Exception, UserEntity>> call(UserEntity user);
}
