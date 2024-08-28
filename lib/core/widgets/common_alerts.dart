import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_marvels/core/routing/app_router.dart';
import 'package:test_app_marvels/core/utils/utils.dart';
import 'package:test_app_marvels/core/widgets/shimmer_loading.dart';

class CommonAlerts {
  // single instance
  CommonAlerts._();
  static final CommonAlerts _instance = CommonAlerts._();

  factory CommonAlerts() => _instance;

  // snakBar
  static showToast(String str, [bool isError = false]) {
    Utils.debug("Alert Message : $str ");
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(
          str,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : Colors.green,
        showCloseIcon: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );
  }

  static void showLoader() {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (ctx) {
        return const CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShimmerLoading(
                isLoading: true,
                child: CircularProgressIndicator.adaptive(),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoader() {
    Navigator.of(navigatorKey.currentContext!).pop();
  }
}
