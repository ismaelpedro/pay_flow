import 'package:package_info_plus/package_info_plus.dart';

class Utilities {
  late String? version;

  Future<void> getVersionApp() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
  }
}
