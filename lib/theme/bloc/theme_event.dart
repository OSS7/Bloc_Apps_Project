part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class GetTheme extends ThemeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetTheme extends ThemeEvent {
  final AppTheme theme;
  const SetTheme({
    required this.theme,
  });
  @override
  List<Object> get props => [theme];
}
