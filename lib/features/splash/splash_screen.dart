import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_marvels/core/extensions/string_extension.dart';
import 'package:test_app_marvels/core/routing/routes.dart';
import 'package:test_app_marvels/core/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final ctx = context;
    Future.delayed(const Duration(seconds: 2), () {
      ctx.pushReplacement(Routes.home.ls);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: kBMargin12,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: kPrimaryBlue.withOpacity(0.2),
                spreadRadius: 20.r,
                blurRadius: 100.r,
              )
            ]),
            child: Container(
              margin: kBMargin12,
              child: Text(
                'Marvels',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 40.sp,
                      color: kPrimaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          50.verticalSpace,
          const Align(
            alignment: Alignment.center,
            child: RepaintBoundary(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ],
      ),
    );
  }
}
