import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? textOverflow;
  const CustomText(
      {Key? key,  required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textOverflow}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      overflow: textOverflow,
    );
  }
}