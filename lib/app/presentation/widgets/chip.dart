import 'package:flutter/material.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';

class DifficultyChip extends StatelessWidget {
  final int difficulty;
  final bool isLarge;

  const DifficultyChip({
    required this.difficulty,
    this.isLarge = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _backgroundColors = [
      Color(0xFFDAEDEB),
      Color(0xFFF3FAEE),
      Color(0xFFFFF4EA),
      Color(0xFFFEE3E3)
    ];
    final _textColors = [
      Color(0xFF3DAB9E),
      Color(0xFF70A64A),
      Color(0xFFF89132),
      Color(0xFFE84545)
    ];
    final _texts = ['EASY', 'NORMAL', 'HARD', 'VERY HARD'];

    return CustomChip(
      backgroundColor: _backgroundColors[difficulty - 2],
      textColor: _textColors[difficulty - 2],
      text: _texts[difficulty - 2],
      isLarge: isLarge,
    );
  }
}

class CustomChip extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final isLarge;

  const CustomChip({
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.isLarge = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isLarge ? 32 : 24,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          text,
          style: isLarge
              ? MyTextStyles.Small_w800.copyWith(color: textColor)
              : MyTextStyles.Tiny_w800.copyWith(color: textColor),
        ),
      ),
    );
  }
}