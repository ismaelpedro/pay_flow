import 'package:flutter/foundation.dart';

abstract class AdmobId {
  static bool isAndroid = defaultTargetPlatform == TargetPlatform.android;
  
  static String loginFullScreen = isAndroid ? 'ca-app-pub-7753595933708072/2043284763' : 'ca-app-pub-7753595933708072/3882742360';
  static String loginBottom = isAndroid ? 'ca-app-pub-7753595933708072/9586514708' : 'ca-app-pub-7753595933708072/9422827744';
}
