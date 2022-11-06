import 'package:example_bloc_interesting/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the buttons this many times:',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            BlocBuilder<CounterBloc, CounterInitial>(
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      bloc.add(IncrementEvent());
                    });
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.plus_one_outlined),
                ),
                const SizedBox(width: 30.0),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      bloc.add(DecrementEvent());
                    });
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.exposure_minus_1_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
