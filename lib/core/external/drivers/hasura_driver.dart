import 'package:hasura_connect/hasura_connect.dart';
import 'package:pay_flow/core/infra/interfaces/drivers/i_hasura_driver.dart';

class HasuraDriver implements IHasuraDriver {
  final HasuraConnect _hasura;
  HasuraDriver(this._hasura);

  @override
  Future<dynamic> mutation(String mutation) async {
    return await _hasura.mutation(mutation);
  }

  @override
  Future<dynamic> query(String query) async {
    return await _hasura.query(query);
  }
}
