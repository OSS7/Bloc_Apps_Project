part of 'localization_cubit.dart';

@immutable
abstract class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

  class UpdateLocalization extends LocalizationState {
  final Locale local;

  UpdateLocalization({required this.local});
}
