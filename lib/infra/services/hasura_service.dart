import 'package:dartz/dartz.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:pay_flow/domain/entities/user_entity.dart';

import '../../domain/exceptions/hasura_exception.dart';
import '../../domain/services/i_hasura_service.dart';

class HasuraService implements IHasuraService {
  HasuraConnect hasura;
  HasuraService(this.hasura);

  @override
  Future<Either<HasuraException, UserEntity>> mutation(String mutation) async {
    return await hasura.mutation(mutation);
  }

  @override
  Future<Either<HasuraException, UserEntity>> query(String query) async {
    return await hasura.query(query);
  }
}
