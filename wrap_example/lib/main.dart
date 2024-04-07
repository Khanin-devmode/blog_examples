import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 4;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Number of items',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('FractionallySizedBox(widthFactor:0.25)')],
            ),
          ),
          Wrap(
            children: List.generate(
              _counter,
              (index) => const CustomFractionallySizedBox(widthFactor: 0.25),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('FractionallySizedBox(widthFactor:0.3)')],
            ),
          ),
          Wrap(
            alignment: WrapAlignment.start,
            children: List.generate(
              _counter,
              (index) => const CustomFractionallySizedBox(widthFactor: 0.3),
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox.expand(
        child: Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 72,
              child: FloatingActionButton(
                  onPressed: _incrementCounter, child: const Icon(Icons.add)),
            ),
            Positioned(
              child: FloatingActionButton(
                  onPressed: _decrementCounter,
                  child: const Icon(Icons.remove)),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFractionallySizedBox extends StatelessWidget {
  const CustomFractionallySizedBox({super.key, required this.widthFactor});

  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Text('$widthFactor')),
    );
  }
}
