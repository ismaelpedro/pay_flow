import 'package:hasura_connect/hasura_connect.dart';
import 'i_hasura_service.dart';

class HasuraService implements IHasuraService {
  HasuraConnect hasura;
  HasuraService(this.hasura);

  @override
  Future<void> mutation(String mutation) async {
    await hasura.mutation(mutation);
  }

  @override
  Future<void> query(String query) async {
    await hasura.query(query);
  }
}
