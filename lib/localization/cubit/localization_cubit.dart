import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../service/local_storage_service.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  Future getLocal() async {
    String local = await LanguageCacheHelper().getLanguageCode();

    emit(UpdateLocalization(local: Locale(local)));
  }

  Future<void> setLocal(String local) async {
    await LanguageCacheHelper().setLanguageCode(local);

    emit(UpdateLocalization(local: Locale(local)));
  }
}
