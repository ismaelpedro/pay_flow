import 'package:pay_flow/infra/dtos/user_dto.dart';
import 'package:dartz/dartz.dart';
import 'i_save_ticket_usecase.dart';

class SaveTicketUsecase implements ISaveTicketUsecase {
  @override
  Future<Either<Exception, UserDto>?> call() async {}
}
