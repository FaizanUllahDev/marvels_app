part of 'theme_bloc.dart';

final class ThemeState extends Equatable {
  final ThemeData currentTheme;

  const ThemeState(this.currentTheme);

  @override
  List<Object> get props => [currentTheme];
}
