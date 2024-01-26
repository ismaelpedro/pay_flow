import 'dart:io';

abstract class AdmobId {
  static String loginFullScreen = Platform.isAndroid
      ? 'ca-app-pub-7753595933708072/2043284763'
      : 'ca-app-pub-7753595933708072/3882742360';

  static String loginBottom = Platform.isAndroid
      ? 'ca-app-pub-7753595933708072/9586514708'
      : 'ca-app-pub-7753595933708072/9422827744';
}
