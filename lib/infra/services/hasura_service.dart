import 'package:dartz/dartz.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../domain/exceptions/hasura_exception.dart';
import '../../domain/services/i_hasura_service.dart';
import '../dtos/user_dto.dart';

class HasuraService implements IHasuraService {
  HasuraConnect hasura;
  HasuraService(this.hasura);

  @override
  Future<Either<HasuraException, UserDto>> mutation(String mutation) async {
    return await hasura.mutation(mutation);
  }

  @override
  Future<Either<HasuraException, UserDto>> query(String query) async {
    return await hasura.query(query);
  }
}
