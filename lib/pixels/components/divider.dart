import 'package:flutter/material.dart';
import 'package:yummy_quest/pixels/styles/color.dart';

class DividerPixel extends StatelessWidget {
  const DividerPixel({
    super.key,
    this.padding = EdgeInsets.zero,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 1,
        color: ColorPixel.gray.shade400.withOpacity(0.15),
      ),
    );
  }
}
