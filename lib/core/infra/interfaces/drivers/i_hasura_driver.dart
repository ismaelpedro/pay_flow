abstract class IHasuraDriver {
  Future<dynamic> query(String query);
  Future<dynamic> mutation(String mutation);
}
