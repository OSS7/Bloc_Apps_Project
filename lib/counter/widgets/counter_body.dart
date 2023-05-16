import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterBody extends StatelessWidget {
  const CounterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBar(
          title: const Text('Counter view'),
          centerTitle: true,
        ),
        BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is UpdateCounter) {
              return Center(
                child: Text('The counter value is ${state.counter}'),
              );
            }
            return const Center(
              child: Text('The counter value is 0'),
            );
          },
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: const Icon(Icons.plus_one),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: const Icon(Icons.exposure_minus_1),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ],
    );
  }
}
