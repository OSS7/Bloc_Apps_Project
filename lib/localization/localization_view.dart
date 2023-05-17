import 'package:flutter/material.dart';

import 'widgets/localization_body.dart';

class LocalizationView extends StatelessWidget {
  const LocalizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LocalizationBody(),
    );
  }
}
