import 'package:cubit_test/theme/bloc/theme_bloc.dart';
import 'package:cubit_test/theme/service/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBody extends StatelessWidget {
  const ThemeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBar(
          title: Text('Theme App'),
        ),

        ///todo change icon when dark.
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                final itemTheme = AppTheme.values[0];

                context.read<ThemeBloc>().add(SetTheme(theme: itemTheme));
              },
              child: Icon(
                Icons.wb_sunny_outlined,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                final itemTheme = AppTheme.values[1];

                context.read<ThemeBloc>().add(SetTheme(theme: itemTheme));
              },
              child: Icon(
                Icons.dark_mode_outlined,
              ),
            ),
          ],
        )
      ],
    );
  }
}
