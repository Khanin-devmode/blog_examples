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
  final List<double> containerSizeList = [50, 100, 200, 300];
  final List<double> imageSizeList = [50, 100, 200, 300];

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
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Container Size 50 x 50 pixel'),
                        const SizedBox(width: 20),
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          color: Colors.red,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 200),
                        Column(
                          children: [
                            const Text('Source image size'),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                ...List.generate(
                                  imageSizeList.length,
                                  (x) {
                                    final size = imageSizeList[x];
                                    return SizedBox(
                                      width: 50,
                                      child: Text('$size x $size'),
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    ...List.generate(FilterQuality.values.length, (y) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(FilterQuality.values[y].toString())),
                          ...List.generate(imageSizeList.length, (x) {
                            return Image.asset(
                              'assets/flutter_logo_${imageSizeList[x]}px.png',
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                              filterQuality: FilterQuality.values[y],
                            );
                          })
                        ],
                      );
                    })
                  ],
                ),
              ),
              // child: SingleChildScrollView(
              //   child: Column(children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: List.generate(containerSizeList.length, (i) {
              //         final size = containerSizeList[i];
              //         return Container(
              //           alignment: Alignment.center,
              //           width: size,
              //           height: size,
              //           color: Colors.red,
              //           child: Text('$size x $size'),
              //         );
              //       }),
              //     ),
              //     ...List.generate(FilterQuality.values.length, (x) {
              //       return Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           SizedBox(
              //               width: 120,
              //               child: Text(FilterQuality.values[x].toString())),
              //           ...List.generate(
              //             containerSizeList.length,
              //             (i) {
              //               return Image.asset(
              //                 'assets/flutter_logo_100px.png',
              //                 fit: BoxFit.cover,
              //                 width: containerSizeList[i],
              //                 height: containerSizeList[i],
              //                 filterQuality: FilterQuality.values[x],
              //               );
              //             },
              //           )
              //         ],
              //       );
              //     }),
              //   ]),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
