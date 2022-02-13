import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import '../../../domain/exceptions/login_exception.dart';

abstract class ISaveUserDatasource {
  Future<Either<LoginException, UserEntity>> call(UserEntity user);
}
