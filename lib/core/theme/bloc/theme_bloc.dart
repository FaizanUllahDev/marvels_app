import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(kAppThemeData[AppTheme.light]!)) {
    on<ThemeEvent>((event, emit) async {
      if (event is ToggleTheme) {
        if (state.currentTheme == kAppThemeData[AppTheme.dark]!) {
          emit(ThemeState(kAppThemeData[AppTheme.light]!));
        } else if (state.currentTheme == kAppThemeData[AppTheme.light]!) {
          emit(ThemeState(kAppThemeData[AppTheme.dark]!));
        }
      }
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    try {
      if (json['light'] as bool) {
        return ThemeState(kAppThemeData[AppTheme.dark]!);
      }
      return ThemeState(kAppThemeData[AppTheme.light]!);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, bool>? toJson(ThemeState state) {
    try {
      return {
        'light': state.currentTheme == kAppThemeData[AppTheme.light]!,
      };
    } catch (e) {
      return null;
    }
  }
}
