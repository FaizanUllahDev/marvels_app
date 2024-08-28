import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_marvels/core/extensions/string_extension.dart';
import 'package:test_app_marvels/core/routing/app_router.dart';
import 'package:test_app_marvels/core/routing/routes.dart';

class Utils {
  static void debug(String message) {
    if (kDebugMode) print(message);
  }

  static void launchURL(String url) {
    debug('launchURL: $url');
    if (url.isEmpty) return;
    navigatorKey.currentContext!.push(
      Routes.webView.ls,
      extra: url,
    );
  }
}
