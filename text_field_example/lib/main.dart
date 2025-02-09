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
      title: 'TextFormField Example',
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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                CustomContainer(
                  size: 48,
                ),
                Expanded(
                  child: CustomTextFormField(),
                ),
              ],
            ),
            Row(
              children: [
                CustomContainer(
                  size: 48,
                ),
                Expanded(
                  child: IncorrectTextFormField(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final double? fontSize;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextFormField({
    super.key,
    this.fontSize,
    this.height,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: fontSize, height: height),
      decoration: InputDecoration(
          border: const OutlineInputBorder(), contentPadding: contentPadding),
    );
  }
}

class IncorrectTextFormField extends StatelessWidget {
  const IncorrectTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(border: Border.all()),
      child: TextFormField(
        style: const TextStyle(fontSize: 32, height: 1.0),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20)),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final int size;
  final Color color;

  const CustomContainer({
    super.key,
    this.size = 48,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: size.toDouble(),
      height: size.toDouble(),
      alignment: Alignment.center,
      child: Text(
        '$size x $size',
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
