import 'package:hasura_connect/hasura_connect.dart';
import '../../infra/interfaces/drivers/i_hasura_driver.dart';

class HasuraDriver implements IHasuraDriver {
  final HasuraConnect _hasura;
  HasuraDriver(this._hasura);

  @override
  Future<dynamic> mutation(
    String mutation, {
    Map<String, dynamic>? variables,
    bool tryAgain = true,
    String? key,
    Map<String, String>? headers,
  }) async {
    return await _hasura.mutation(
      mutation,
      variables: variables,
      tryAgain: tryAgain,
      key: key,
      headers: headers,
    );
  }

  @override
  Future<dynamic> query(
    String query, {
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  }) async {
    return await _hasura.query(
      query,
      variables: variables,
      headers: headers,
    );
  }
}
