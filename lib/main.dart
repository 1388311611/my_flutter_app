import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter',
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  double _step = 1.0;

  void _incrementCounter() {
    setState(() {
      _counter += _step.toInt();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter -= _step.toInt();
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _updateStep(double value) {
    setState(() {
      _step = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            ElevatedButton(
              child: Text("Reset"),
              onPressed: _resetCounter,
            ),

            SizedBox(height: 20),
            Text(
              'Step:',
            ),
            Slider(
              value: _step,
              min: 1.0,
              max: 8.0,
              divisions: 8,
              onChanged: _updateStep,
              label: _step.toString(),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
} 