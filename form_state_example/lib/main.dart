import 'package:flutter/material.dart';

void main() {
  runApp(const WrapExampleApp());
}

class WrapExampleApp extends StatelessWidget {
  const WrapExampleApp({super.key});

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final formKey = GlobalKey<FormState>();
  final globalKey1 = GlobalKey<FormState>();
  final globalKey2 = GlobalKey<FormState>();
  final globalKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Form'),
              SizedBox(height: 8),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      key: globalKey1,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        label: Text('TextFormField 1'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Text cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      key: globalKey2,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        label: Text('TextFormField 2'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Text cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      key: globalKey3,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        label: Text('TextFormField 3'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Text cannot be empty';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.validate();
                        if (formKey.currentState!.validate()) {
                          print('some thing');
                        }
                        ;
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
