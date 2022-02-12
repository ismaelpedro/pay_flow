import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import '../../exceptions/login_exception.dart';

abstract class ILoginWithGoogleUsecase {
  Future<Either<LoginException, UserEntity>> call();
}
