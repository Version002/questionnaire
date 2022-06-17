import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SmallUnderline extends StatelessWidget {
  const SmallUnderline({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.white,
    );
  }
}