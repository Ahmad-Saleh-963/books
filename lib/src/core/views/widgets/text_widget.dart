import 'package:flutter/material.dart';


class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
    this.name, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
  });
  final String name;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontFamily: "booksStroeFonts",
          color: color ?? Colors.black,
          fontSize: fontSize ?? 12.0,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
