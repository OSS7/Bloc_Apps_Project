import 'package:cubit_test/counter/bloc/counter_bloc.dart';
import 'package:cubit_test/counter/counter_view.dart';
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
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          if (state is UpdateLocalization) {
            return MaterialApp(
              locale: state.local,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
                useMaterial3: true,
              ),
              home: const LocalizationView(),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
