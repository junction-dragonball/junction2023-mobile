import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';

class SuccessDialog extends StatelessWidget {
  final String text;
  const SuccessDialog({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 160,
          height: 160,
          padding: const EdgeInsets.symmetric(vertical: 32),
          decoration: BoxDecoration(
            color: MyColors.White,
            borderRadius: BorderRadius.circular(12),
          ),
          child: GapColumn(
            gap: 16,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/green_filled_check.png',
                width: 64,
                height: 64,
              ),
              Text(text,style: MyTextStyles.Small_w800),
            ],
          ),
        ),
      ),
    );
  }
}
