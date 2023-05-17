import 'package:cubit_test/theme/widgets/theme_body.dart';
import 'package:flutter/material.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemeBody(),
    );
  }
}
