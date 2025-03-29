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
            // Row(
            //   children: [
            //     CustomContainer(
            //       size: 48,
            //     ),
            //     Expanded(
            //       child: CustomTextFormField(),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Expanded(
                  child: CustomErrorTextFormField(),
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
        border: const OutlineInputBorder(),
        contentPadding: contentPadding,
        // error: Row(
        //   children: [
        //     Icon(
        //       Icons.info,
        //       color: Colors.red[800],
        //     ),
        //     SizedBox(width: 4),
        //     Text(
        //       'This is error text',
        //       style: TextStyle(color: Colors.red[800]),
        //     )
        //   ],
        // ),
      ),
      validator: (value) {
        if (value != null && value.contains('@')) {
          return 'The "@" symbol is not allowed.';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.always,
    );
  }
}

class CustomErrorTextFormField extends StatefulWidget {
  const CustomErrorTextFormField({super.key});

  @override
  State<CustomErrorTextFormField> createState() =>
      _CustomErrorTextFormFieldState();
}

class _CustomErrorTextFormFieldState extends State<CustomErrorTextFormField> {
  final ValueNotifier<String?> _errorTextNotifier =
      ValueNotifier<String?>(null);

  String? _someValidationLogic(String? value) {
    if (value == null || value.isEmpty) {
      return 'Textfield cannot be empty';
    }
    return null;
  }

  @override
  void dispose() {
    _errorTextNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: TextFormField(
            style: TextStyle(fontSize: 6),
            autovalidateMode: AutovalidateMode.always,
            validator: (value) {
              final result = _someValidationLogic(value);

              if (result != _errorTextNotifier.value) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => _errorTextNotifier.value = result,
                );
              }
              return result;
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                errorStyle: TextStyle(fontSize: 0)),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _errorTextNotifier,
          builder: (context, errorText, child) {
            return _errorTextNotifier.value != null
                ? Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.red[900],
                      ),
                      Text(
                        errorText.toString(),
                        style: TextStyle(color: Colors.red[900]),
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class IncorrectTextFormField extends StatelessWidget {
  const IncorrectTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 12),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
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
    this.color = Colors.blue,
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
