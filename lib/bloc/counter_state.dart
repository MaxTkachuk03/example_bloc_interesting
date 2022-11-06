part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

// ignore: must_be_immutable
class CounterInitial extends CounterState {
  int _counter = 0;

  int get count => _counter;

  increment(){
    _counter++;
  }

  decrement(){
    _counter--;
  }
}
