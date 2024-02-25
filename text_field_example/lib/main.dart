import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: ''),
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
  final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(1),
      borderSide: const BorderSide(width: 1.2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // const Text(
              //   'Max Lines 5',
              // ),
              // TextFormField(
              //   decoration: InputDecoration(border: outlineInputBorder),
              //   maxLines: 4,
              // ),
              // const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(border: outlineInputBorder),
                minLines: 2,
                maxLines: 2,
              ),
              // const SizedBox(height: 16.0),
              // TextFormField(
              //   decoration: InputDecoration(border: outlineInputBorder),
              // ),
              // const SizedBox(height: 16.0),
              // Row(
              //   children: [
              //     Expanded(
              //         child: Container(
              //       height: 100,
              //       color: Colors.amber,
              //     )),
              //     Expanded(
              //       child: TextFormField(
              //         style: TextStyle(fontSize: 60, height: 1),
              //         decoration: InputDecoration(
              //             border: outlineInputBorder,
              //             contentPadding: const EdgeInsets.all(20)),
              //       ),
              //     )
              //   ],
              // ),
              // const SizedBox(height: 16),
              // Row(
              //   children: [
              //     Expanded(
              //         child: Container(
              //       height: 100,
              //       color: Colors.amber,
              //     )),
              //     Expanded(
              //       child: TextFormField(
              //         style: TextStyle(fontSize: 20, height: 1),
              //         maxLines: 3,
              //         decoration: InputDecoration(
              //           border: outlineInputBorder,
              //           contentPadding: const EdgeInsets.all(20),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
