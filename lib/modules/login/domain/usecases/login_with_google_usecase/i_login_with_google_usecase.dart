import 'package:dartz/dartz.dart';

import '../../entities/user.dart';

abstract class ILoginWithGoogleUsecase {
  Future<Either<Exception, User>> call();
}
