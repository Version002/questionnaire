// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class WhiteText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double? size;

  WhiteText({required this.text, required this.fontWeight, required this.size});
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
