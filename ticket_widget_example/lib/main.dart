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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Ticket',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TicketWidget(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TicketWidget(
                headWidth: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TicketWidget(
                headWidth: 200,
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TicketWidget extends StatelessWidget {
  const TicketWidget(
      {super.key, this.height = 120, this.headWidth = 140, this.radius = 20});

  final double height;
  final double headWidth;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: headWidth,
          height: height,
          child: CustomPaint(
            painter: InvertedBorderPainter(
              borderWidth: 2,
              borderColor: Colors.red,
              radius: radius,
            ),
            child: const Center(child: Text('This is head')),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: height,
            child: CustomPaint(
              painter: InvertedBorderPainter(
                borderWidth: 2,
                borderColor: Colors.blue,
                radius: radius,
              ),
              child: const Center(child: Text('This is tail')),
            ),
          ),
        )
      ],
    );
  }
}

class InvertedBorderPainter extends CustomPainter {
  final double borderWidth;
  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double ticketHeadWidth;

  InvertedBorderPainter({
    this.borderWidth = 2,
    this.borderColor = Colors.black,
    this.backgroundColor = Colors.black12,
    this.radius = 20.0,
    this.ticketHeadWidth = 50,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path borderPath = Path()
      ..moveTo(0, radius)
      ..arcToPoint(
        Offset(radius, 0),
        clockwise: false,
        radius: Radius.circular(radius),
      )
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(
        Offset(size.width, radius),
        clockwise: false,
        radius: Radius.circular(radius),
      )
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(
        Offset(size.width - radius, size.height),
        clockwise: false,
        radius: Radius.circular(radius),
      )
      ..lineTo(radius, size.height)
      ..arcToPoint(
        Offset(0, size.height - radius),
        clockwise: false,
        radius: Radius.circular(radius),
      )
      ..close();

    Paint bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..strokeWidth = borderWidth;

    Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(borderPath, bgPaint);
    canvas.drawPath(borderPath, borderPaint);

    // Inner fill or additional styling can be added here if needed
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
