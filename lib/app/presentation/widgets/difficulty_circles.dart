import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';

class DifficultyCircles extends StatelessWidget {
  final int difficulty;
  final double radius;
  const DifficultyCircles({
    super.key,
    required this.difficulty,
    required this.radius,
  });


  @override
  Widget build(BuildContext context) {
    return GapRow(
      gap: 2,
      children: List.generate(
        5,
            (index) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index + 1 <= difficulty ? Colors.black12 : Colors.transparent,
            border: Border.all(width: 1, color: Colors.black12),
          ),
          width: radius*2,
          height: radius*2,
        ),
      ),
    );
  }
}