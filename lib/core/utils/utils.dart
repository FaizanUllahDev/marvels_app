import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_marvels/core/extensions/string_extension.dart';
import 'package:test_app_marvels/core/routing/app_router.dart';
import 'package:test_app_marvels/core/routing/routes.dart';
import 'package:test_app_marvels/keys/keys.dart';

class Utils {
  static String getHashed() {
    String ts = DateTime.now().millisecondsSinceEpoch.toString();
    // Create the hash using the format: ts + privateKey + publicKey
    String hash = md5
        .convert(utf8.encode(ts + AppKeys.apiPrivateKey + AppKeys.apiPublicKey))
        .toString();

    return 'ts=$ts&apikey=${AppKeys.apiPublicKey}&hash=$hash';
  }

  static void debug(String message) {
    if (kDebugMode) print(message);
  }

  static void launchURL(String url) {
    debug('launchURL: $url');
    if (url.isEmpty) return;
    navigatorKey.currentContext!.push(
      Routes.webView.ls,
      extra: '$url?${getHashed()}',
    );
  }
}
