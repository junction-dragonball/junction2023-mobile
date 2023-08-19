part of 'quest_detail_screen_controller.dart';

class _GuideBottomSheetDialog extends StatelessWidget {
  final void Function() onConfirmTap;
  final List<String> instructions;

  const _GuideBottomSheetDialog({
    required this.onConfirmTap,
    required this.instructions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: MyColors.White,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('What Should I Do?', textAlign: TextAlign.center, style: MyTextStyles.Medium_w800),
            Container(
                padding: EdgeInsets.only(top: 24, bottom: 40),
                child: GapColumn(
                  children: [
                    ...List.generate(instructions.length, (index) {
                      return _CustomListTile(
                        index: index,
                        text: instructions[index],
                      );
                    }).toList(),
                  ],
                  gap: 20,
                )),
            GestureDetector(
              onTap: onConfirmTap,
              child: Container(
                height: 56,
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MyColors.Dim200,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Text(
                  'Confirm',
                  style: MyTextStyles.Medium_w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
