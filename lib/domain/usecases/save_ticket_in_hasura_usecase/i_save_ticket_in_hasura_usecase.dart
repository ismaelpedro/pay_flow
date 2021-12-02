import 'package:dartz/dartz.dart';
import '../../../infra/dtos/user_dto.dart';

abstract class ISaveTicketInHasuraUsecase {
  Future<Either<Exception, UserDto>?> call();
}
