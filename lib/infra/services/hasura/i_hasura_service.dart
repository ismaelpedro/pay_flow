abstract class IHasuraService {
  Future<void> mutation(String mutation);
  Future<void> query(String mutation);
}
