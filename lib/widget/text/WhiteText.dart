import 'package:flutter/material.dart';

class WhiteText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double? size;

  WhiteText({required this.text, required this.fontWeight,required this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          color: Colors.white,
        ),
      ),
    );
  }
}