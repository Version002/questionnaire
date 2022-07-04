// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class BlackText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double? size;

  const BlackText(
      {required this.text, required this.fontWeight, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        color: Colors.black,
      ),
    );
  }
}
