import 'package:flutter/material.dart';

import 'widgets/counter_body.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CounterBody(),
    );
  }
}
