import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: Colors.black,
          width: size.width,
          height: 266,
          child: CustomPaint(painter: DrawPainter()),
        ),
        const Positioned(
          left: 30,
          top: 127,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 41,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Manage Your Buses And Drivers',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class DrawPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    // Rect rect=Rect.fromCircle(center: Offset(size.height/2,size.width/2), radius: size.width/2);
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 2 / 3)
      ..lineTo(size.width * 5 / 6, size.height)
      ..lineTo(size.width / 6, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
