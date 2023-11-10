import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(directories: [
      WidgetbookFolder(
        name: 'Atoms',
        children: [
          WidgetbookComponent(
            name: 'Component1',
            useCases: [
              WidgetbookUseCase(
                name: 'Usecase1',
                builder: (BuildContext context) {
                  return Scaffold(
                    body: Center(
                      child: Container(
                        color: Colors.amberAccent,
                        width: context.knobs.double.slider(
                            label: 'width',
                            min: 10,
                            max: 100,
                            initialValue: 50),
                        height: context.knobs.double.slider(
                            label: 'height',
                            min: 10,
                            max: 100,
                            initialValue: 50),
                      ),
                    ),
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'Usecase2',
                builder: (BuildContext context) {
                  return Scaffold();
                },
              ),
              WidgetbookUseCase(
                name: 'Usecase3',
                builder: (BuildContext context) {
                  return Scaffold();
                },
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'Component2',
            useCases: [
              WidgetbookUseCase(
                name: 'Usecase1',
                builder: (BuildContext context) {
                  return Scaffold();
                },
              ),
              WidgetbookUseCase(
                name: 'Usecase2',
                builder: (BuildContext context) {
                  return Scaffold();
                },
              ),
              WidgetbookUseCase(
                name: 'Usecase3',
                builder: (BuildContext context) {
                  return Scaffold();
                },
              ),
            ],
          ),
        ],
      )
    ]);
  }
}
