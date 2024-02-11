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
        title: const Text('Ticket'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TicketRowPrototype(),
            CustomPaint(
              painter: InvertedBorderPainter(
                borderWidth: 20,
                borderColor: Colors.red,
                radius: 20,
              ),
              child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(child: Text('this is some text!'))),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TicketRowPrototype extends StatelessWidget {
  const TicketRowPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: Border.all(
                    color: Colors.red,
                    width: 8.0,
                  ) +
                  Border.all(
                    color: Colors.green,
                    width: 8.0,
                  ) +
                  Border.all(
                    color: Colors.blue,
                    width: 8.0,
                  ),
            ),
            // decoration: ShapeDecoration(shape: CustomShape()),
            // decoration: const BoxDecoration(
            //   color: Colors.white70,
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(16),
            //     bottomLeft: Radius.circular(16),
            //   ),
            //   border: Border(
            //     top: BorderSide(),
            //     left: BorderSide(),
            //     bottom: BorderSide(),
            //   ),
            // ),
          ),
          Expanded(
            child: ClipPath(
              clipper: InvertedBorderRadiusLeft(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border(
                    top: BorderSide(),
                    right: BorderSide(),
                    bottom: BorderSide(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InvertedBorderRadiusLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    const double radius = 12;
    path.moveTo(radius, 0);
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(radius, size.height);

    path.arcToPoint(Offset(0, size.height - radius),
        radius: Radius.circular(radius), clockwise: false);
    path.lineTo(0, radius);
    // path.quadraticBezierTo(radius, radius, radius, 0);
    path.arcToPoint(Offset(radius, 0),
        radius: Radius.circular(radius), clockwise: false);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class InvertedBorderRadiusRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    const double radius = 12;
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(Offset(size.width, radius),
        radius: Radius.circular(radius), clockwise: false);
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(Offset(size.width - radius, size.height),
        radius: Radius.circular(radius), clockwise: false);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var radius = 11;

    var paint = Paint();
    paint.color = Colors.black;

    // return canvas.drawPath(path, paint);
    return canvas.drawCircle(Offset(0, 0), radius + 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CustomShape extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getOuterPath
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }
}

class InvertedBorderPainter extends CustomPainter {
  final double borderWidth;
  final Color borderColor;
  final double radius;

  InvertedBorderPainter({
    this.borderWidth = 5.0,
    this.borderColor = Colors.black,
    this.radius = 20.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

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

    canvas.drawPath(borderPath, paint);

    // Inner fill or additional styling can be added here if needed
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
