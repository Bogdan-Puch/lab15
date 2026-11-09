import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Завдання 1: Клас для розрахунку функції виду y = (x^2 - x) / x^3 (варіант 16)
class FunctionCalculator {
  double calculate(double x) {
    if (x == 0) throw ArgumentError('x cannot be 0');
    return (x * x - x) / (x * x * x);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Завдання 3: Зміна назви згідно шаблону <Group>: <Name>'s last Flutter App
      title: "32-ICT: Bogdan's last Flutter App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: "32-ICT: Bogdan's last Flutter App"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final FunctionCalculator _calculator = FunctionCalculator();
  double _result = 0.0;

  void _incrementCounter() {
    setState(() {
      // Завдання 2: Крок лічильника дорівнює 2 (для варіанта 16)
      _counter += 2;
      try {
        _result = _calculator.calculate(_counter.toDouble());
      } catch (e) {
        _result = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Function Result y(x): $_result',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      // Завдання 2: FloatingActionButton з іконкою Icons.pets (варіант 16)
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.pets),
      ),
    );
  }
}