import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';

class SuccessDialog extends StatefulWidget {
  final String text;
  final bool? runConfetti;

  const SuccessDialog({
    Key? key,
    required this.text,
    this.runConfetti = false,
  }) : super(key: key);

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(duration: const Duration(seconds: 3));

    if (widget.runConfetti ?? false) {
      _confettiController.play();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              colors: [
                Color(0xFF337AFF),
                Color(0xFF33FF77),
                Color(0xFF33FFCF),
                Color(0xFF9233FF),
                Color(0xFFD9FF33),
                Color(0xFFFF3370),
                Color(0xFFFF33C1),
                Color(0xFFFF9233),
              ],
              minimumSize: const Size(16, 8),
              maximumSize: const Size(24, 12),
              numberOfParticles: 15,
            ),
          ),
          Material(
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
                  Text(widget.text, style: MyTextStyles.Small_w800),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
