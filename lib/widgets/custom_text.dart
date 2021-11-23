import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final TextAlign? textAlign;
  const CustomText(
      {Key? key,  required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textOverflow,
      this.maxLines,
      this.textAlign}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      overflow: textOverflow,
      textAlign: textAlign,
    );
  }
}