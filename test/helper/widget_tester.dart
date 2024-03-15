import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    if (key.contains('.svg')) {
      return ByteData.view(Uint8List.fromList(utf8.encode(_sampleSVG)).buffer);
    } else if (key.contains('.png')) {
      return ByteData.view(const Base64Decoder().convert(_samplePNG).buffer);
    } else if (key == 'AssetManifest.json') {
      return ByteData.view(Uint8List.fromList(utf8.encode('{}')).buffer);
    }

    return ByteData(0);
  }

  final String _sampleSVG = '''
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M6 9L12 15L18 9" stroke="#165C7D" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      ''';

  final String _samplePNG =
      'iVBORw0KGgoAAAANSUhEUgAAACkAAAAcCAYAAAD815boAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAPhSURBVHgBzVhNbxNXFD13PGbVqq5E2db5BQ0Sol3a/yDs2uKWybJfymRXtaCMBXsb8bVM+BJL8g9i7xAgBX4BXiJAwmyBzOPcOxN77EzicSaCHMny85uZ986779zz7liguHamgYqsAdLA8cEz7MSr+OdpTxKC3pZ1Ozck0Xf44nDfQKRmzZ246cOvrJEcEJP130+7OC64+WNIsh3dYcHNs84i+NeTb1ESbh01VBBgB5uyjAHK4sbZAQTfe/ZDZIiScHexRILbHLQDHy/4ew1HBA8lwejVSUg1/ZAE63Dop5cid4dkeR0lUYokSYSM2jabDRIc8Lspv7PtY4HtnpHWqN5Bx6TwOUm6+1i06OnWwiZv4wNOy28kRsgvGLDdZFSXjbxwMZQCyQY4BOYiqdEwrcVp9HRrPSMXMVH26JpR3SC5Jpu3LaqCdRJdn1cCftEbOTD9FOts1vkZcsI2yU1Y1qnWxSUXoyEehjG3+829Kz2NKi8FJNfjgjSZAo7T4O+2LaIAEgsCB/rz8cI+5NRW1mzLrIPRqyJIJzfUfv63Xq34D0VkceJZh+7r+5dXJ8byEbG5knb18BHL+9rVhAXtA7MVCj8lqNt5ThMjS1Bxwq92jKAI+12bn9sWAT538vz/4SgilASjH1piJYnWKGJXuSQnbEUTI8ZVrniBE2xO3/vdr/9p9JaUoFfxmq/uXYn4CWK4ZjKBtzL9jCVWyxygnXYdaFd7SJJcY2QrCc7JBYR5iWETel7dGrF7/nIjGuz2qx55VbVbrwVhrv1owqV2NczYVTiTJCP2DJqNY6wUyUYnLAoyUJ2y18gNN7q5CzSNfjB9JotI9L45k+S8unnv+z2NmLDMO9m6aPfUlsJatVpN7pf8DM4cowfqPZfkiGxB3Qw3omEsrp0MJtGp1iV34quv34qj1bAm8CqV9gS56WP0AL3PJDkiO9bN+JhjVLPH3Ju7l7tO9HTR7E6fA/pMpNNZneYeowfofTzWDJ/Mwo41NWRnhcSAXXsMuRZEqQ6j0cR6jDJiHYyTsc3odWeR2/XJuUjahA9I8KMZ8oWkgyR3SDbHkFPz1sSI0nv71GEo5y05Z6OImechLR6CTPGgx9zWdPGQHqPbKUG1mFVLjKIEMzh0qWbbzMqHzauj4oEJQXKLWpoxgluj+tJnEdLCoV9NChcYuUQTTYWUQJdbvkVCuweBQq8tczGbKInSlblij10VsJV5UCqS01C74nbPztrC0FNM1H+lB60Rr58JcQQ4MoLKR9+9nesLbv3ECjse/zlwBG+OpeF45u/+OSBeU6yRENXs+wHHB30SjPDHo94n1YygVkVcgC8AAAAASUVORK5CYII=';
}

extension HelperTest on WidgetTester {
  Future<void> pumpPage(
    Widget page, {
    Map<String, Widget Function(BuildContext)>? routes,
    List<NavigatorObserver>? navigatorObservers,
  }) async {
    await pumpWidget(
      DefaultAssetBundle(
        bundle: TestAssetBundle(),
        child: MaterialApp(
          navigatorObservers: navigatorObservers ?? [],
          routes: routes ?? {},
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
          ],
          locale: const Locale('pt', 'BR'),
          home: page,
        ),
      ),
    );
    await pump();
  }
}
