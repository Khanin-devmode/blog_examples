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
  final List<double> containerSizeList = [50, 100, 200];
  final List<double> imageSizeList = [50, 100, 200, 300];
  final double gap = 8;
  final double leftColumnWidth = 100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double dpr = MediaQuery.of(context).devicePixelRatio;

    return SafeArea(
      child: DefaultTabController(
        length: containerSizeList.length,
        child: Scaffold(
          bottomNavigationBar: TabBar(tabs: [
            ...List.generate(containerSizeList.length, (i) {
              final size = containerSizeList[i];
              return Tab(
                child: Column(
                  children: [
                    const Text('Container Size'),
                    Text('$size x $size'),
                  ],
                ),
              );
            })
          ]),
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
              TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ...List.generate(containerSizeList.length, (z) {
                    final containerSize = containerSizeList[z];
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        'Container Size $containerSize x $containerSize pixel'),
                                    const SizedBox(width: 20),
                                    Container(
                                      alignment: Alignment.center,
                                      width: containerSize,
                                      height: containerSize,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: leftColumnWidth,
                                        alignment: Alignment.topLeft,
                                        child: Text('FilterQuality'),
                                      ),
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
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        right: gap),
                                                    child: SizedBox(
                                                      width: containerSize,
                                                      child:
                                                          Text('$size x $size'),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                ...List.generate(FilterQuality.values.length,
                                    (y) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: leftColumnWidth,
                                          child: Text(
                                            FilterQuality.values[y].name,
                                          ),
                                        ),
                                        ...List.generate(
                                          imageSizeList.length,
                                          (x) {
                                            final int sizeInt =
                                                imageSizeList[x].toInt();

                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(right: gap),
                                              child: Image.asset(
                                                'assets/flutter_logo_${sizeInt}px.png',
                                                fit: BoxFit.cover,
                                                width: containerSize,
                                                height: containerSize,
                                                filterQuality:
                                                    FilterQuality.values[y],
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
