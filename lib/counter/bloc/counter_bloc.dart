import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      switch (event) {
        case IncrementCounter():
          counter += 1;
          emit(UpdateCounter(counter));
        case DecrementCounter():
          counter -= 1;
          emit(UpdateCounter(counter));
      }
    });
  }
}
