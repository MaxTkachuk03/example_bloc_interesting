import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterInitial> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>((event,emit) {
      emit(state.increment());
    });

    on<DecrementEvent>((event, emit) {
      emit(state.decrement());
    });
  }
}
