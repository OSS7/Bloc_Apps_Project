part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class UpdateCounter extends CounterState {
  final int? counter;

  UpdateCounter(this.counter);
}
