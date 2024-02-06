import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme =
        WidgetbookTheme(name: 'Light theme', data: ThemeData.light());

    final darkTheme =
        WidgetbookTheme(name: 'Dark theme', data: ThemeData.dark());

    return Widgetbook.material(
      // addons: [
      //   DeviceFrameAddon(
      //     devices: [
      //       Devices.ios.iPhone13Mini,
      //       Devices.ios.iPhone13ProMax,
      //     ],
      //     initialDevice: Devices.ios.iPhone13ProMax,
      //   ),
      //   MaterialThemeAddon(
      //       themes: [lightTheme, darkTheme], initialTheme: lightTheme)
      // ],
      directories: [
        // WidgetbookFolder(
        //   name: 'Atoms',
        //   children: [
        //     WidgetbookComponent(
        //       name: 'Component1',
        //       useCases: [
        //         WidgetbookUseCase(
        //           name: 'Usecase1',
        //           builder: (BuildContext context) {
        //             final width = context.knobs.double.slider(
        //                 label: 'width', min: 10, max: 100, initialValue: 50);
        //             final height = context.knobs.double.slider(
        //                 label: 'height', min: 10, max: 100, initialValue: 50);

        //             return Scaffold(
        //               body: Center(
        //                 child: Container(
        //                   color: Colors.purpleAccent,
        //                   width: width,
        //                   height: height,
        //                 ),
        //               ),
        //             );
        //           },
        //         ),
        //         WidgetbookUseCase(
        //           name: 'Usecase2',
        //           builder: (BuildContext context) {
        //             return Scaffold();
        //           },
        //         ),
        //         WidgetbookUseCase(
        //           name: 'Usecase3',
        //           builder: (BuildContext context) {
        //             return Scaffold();
        //           },
        //         ),
        //       ],
        //     ),
        //     WidgetbookComponent(
        //       name: 'Component2',
        //       useCases: [
        //         WidgetbookUseCase(
        //           name: 'Usecase1',
        //           builder: (BuildContext context) {
        //             return Scaffold();
        //           },
        //         ),
        //         WidgetbookUseCase(
        //           name: 'Usecase2',
        //           builder: (BuildContext context) {
        //             return Scaffold();
        //           },
        //         ),
        //         WidgetbookUseCase(
        //           name: 'Usecase3',
        //           builder: (BuildContext context) {
        //             return Scaffold();
        //           },
        //         ),
        //       ],
        //     ),
        //   ],
        // )
      ],
    );
  }
}
