import 'package:cubit_test/counter/bloc/counter_bloc.dart';
import 'package:cubit_test/counter/counter_view.dart';
import 'package:cubit_test/theme/bloc/theme_bloc.dart';
import 'package:cubit_test/theme/service/theme_app.dart';
import 'package:cubit_test/theme/theme_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/cubit/localization_cubit.dart';
import 'localization/localization_view.dart';
import 'localization/service/localization_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => LocalizationCubit()..getLocal(),
        ),
        BlocProvider(
          create: (BuildContext context) => ThemeBloc()..add(GetTheme()),
        ),
      ],
      child: Builder(
        builder: (context) {
          Locale? local;
          ThemeData? theme;
          final localeCubit = context.watch<LocalizationCubit>().state;
          final themeBloc = context.watch<ThemeBloc>().state;
          if (themeBloc is UpdateTheme) {
            theme = themeBloc.theme;
          }
          if (localeCubit is UpdateLocalization) {
            local = localeCubit.local;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: local,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            theme: theme,
            title: 'Flutter Demo',
            home: const ThemeView(),
          );
        },
      ),
    );
  }
}
