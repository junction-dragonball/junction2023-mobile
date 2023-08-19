import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';

class CustomListTile extends StatelessWidget {
  final int order;
  final String text;

  const CustomListTile({
    required this.order,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GapRow(
      gap: 16,
      children: [
        CircleAvatar(
          backgroundColor: MyColors.Dim900,
          radius: 12,
          child: Text(
            order.toString(),
            style: MyTextStyles.Tiny_w800.copyWith(color: MyColors.White),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: MyTextStyles.Medium_w400.copyWith(color: MyColors.Dim800),
          ),
        ),
      ],
    );
  }
}