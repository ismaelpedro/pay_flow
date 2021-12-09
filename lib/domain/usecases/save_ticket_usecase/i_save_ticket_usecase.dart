import 'package:dartz/dartz.dart';
import '../../../infra/dtos/user_dto.dart';

abstract class ISaveTicketUsecase {
  Future<Either<Exception, UserDto>?> call();
}
