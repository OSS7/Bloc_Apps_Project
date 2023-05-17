part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class UpdateTheme extends ThemeState {
  final ThemeData theme;

  const UpdateTheme(this.theme);
  @override
  List<Object?> get props => [theme];
}
