import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_marvels/core/di/di_server.dart';
import 'package:test_app_marvels/core/extensions/string_extension.dart';
import 'package:test_app_marvels/core/routing/routes.dart';
import 'package:test_app_marvels/core/widgets/custom_webview_screen.dart';
import 'package:test_app_marvels/features/character/data/models/charactor_model.dart';
import 'package:test_app_marvels/features/character/presentation/cubit/character_cubit.dart';
import 'package:test_app_marvels/features/character/presentation/pages/character_page.dart';
import 'package:test_app_marvels/features/character/presentation/pages/charactor_details_page.dart';
import 'package:test_app_marvels/features/splash/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.splash,
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: Routes.webView,
        path: Routes.webView.ls,
        builder: (context, state) => CustomWebviewScreen(
          url: state.extra as String,
        ),
      ),
      GoRoute(
        name: Routes.home,
        path: Routes.home.ls,
        builder: (context, state) => BlocProvider<CharacterCubit>(
          create: (context) => sl<CharacterCubit>()..getCharacters(),
          child: const CharacterPage(),
        ),
      ),
      GoRoute(
        name: Routes.characterDetails,
        path: Routes.characterDetails.ls,
        builder: (context, state) => BlocProvider<CharacterCubit>(
          create: (context) => sl<CharacterCubit>(),
          child: CharacterDetailsPage(
            charactor: state.extra as CharacterModel,
          ),
        ),
      ),
    ],
    navigatorKey: navigatorKey,
  );
}
