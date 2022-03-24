import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/custom_painter/custom_painter_demo.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomPainterDemo(),
    );
  }

}