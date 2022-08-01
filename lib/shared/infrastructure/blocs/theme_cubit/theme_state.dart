part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  final ThemeMode theme;
  const ThemeState(this.theme);
  Brightness get brightness {
    return theme == ThemeMode.light ? Brightness.dark : Brightness.light;
  }
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(ThemeMode.light);

  @override
  List<Object> get props => [theme, super.brightness];
}

class ThemeUpddated extends ThemeState {
  ThemeUpddated(ThemeMode theme) : super(theme);

  @override
  List<Object> get props => [theme, super.brightness];
}
