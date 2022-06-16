abstract class Environments {
  Environments._();

  static const String hasuraUrl = String.fromEnvironment('HASURA_URL');
  static const String hasuraAdminSecret = String.fromEnvironment('ADMIN_SECRET');
}
