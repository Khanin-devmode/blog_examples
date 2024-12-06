import 'package:flutter/material.dart';

void main() {
  runApp(const FilterQualityExample());
}

class FilterQualityExample extends StatelessWidget {
  const FilterQualityExample({super.key});

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final List<double> sizeList = [50, 100, 200, 300];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double dpr = MediaQuery.of(context).devicePixelRatio;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                  alignment: Alignment.topCenter,
                  child: Text('Logical pixels: ${size.width} px, DPR: $dpr')),
            ),
            Positioned.fill(
              child: Container(
                alignment: Alignment.centerLeft,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text('Logical pixels: ${size.height} px, DPR: $dpr'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(sizeList.length, (i) {
                      final size = sizeList[i];
                      return Container(
                        alignment: Alignment.center,
                        width: size,
                        height: size,
                        color: Colors.red,
                        child: Text('$size x $size'),
                      );
                    }),
                  ),
                  ...List.generate(FilterQuality.values.length, (x) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        sizeList.length,
                        (i) {
                          return Image.asset(
                            'assets/flutter_logo_100px.png',
                            fit: BoxFit.cover,
                            width: sizeList[i],
                            height: sizeList[i],
                            filterQuality: FilterQuality.values[x],
                          );
                        },
                      ),
                    );
                  }),
                ]),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
