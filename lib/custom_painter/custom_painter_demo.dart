import 'package:flutter/material.dart';

class CustomPainterDemo extends StatelessWidget {
  const CustomPainterDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(300, 300),
        painter:DemoCustomPainter() ,
      ),
    );
  }
}
class DemoCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    var circlePaint = Paint();
    circlePaint.strokeWidth = 2.0;
    circlePaint.color = Colors.white;
    circlePaint.style = PaintingStyle.fill;

    var paint = Paint();
    paint.strokeWidth = 2.0;
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;

   /* canvas.drawRect(Rect.fromCircle(center: Offset(size.width/2,size.height/2),
        radius: 88), paint);

    canvas.drawCircle(Offset(size.width/2,size.height/2), 88, circlePaint);*/

    canvas.drawLine(const Offset(0,200),const Offset(50,0) , paint);
    canvas.drawLine(const Offset(50,0),const Offset(250,0) , paint);
    canvas.drawLine(const Offset(250,0),const Offset(280,200) , paint);
    canvas.drawLine(const Offset(280,200),const Offset(0,200) , paint);





  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
