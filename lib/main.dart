import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app_marvels/core/di/di_server.dart';
import 'package:test_app_marvels/core/routing/app_router.dart';
import 'package:test_app_marvels/core/theme/bloc/theme_bloc.dart';
import 'package:test_app_marvels/core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if we use state management like bloc or cubit to store data
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationDocumentsDirectory(),
  // );
  // service locator init
  initDIService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        enableScaleWH: () => true,
        enableScaleText: () => true,
        ensureScreenSize: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Dojo Expert',
            debugShowCheckedModeBanner: false,
            color: Colors.white,
            theme: kAppThemeData[AppTheme.light],
            darkTheme: kAppThemeData[AppTheme.light],
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
