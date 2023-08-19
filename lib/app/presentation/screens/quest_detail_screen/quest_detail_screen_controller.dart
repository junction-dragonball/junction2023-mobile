import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_quest_use_case.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';

class QuestDetailScreenController extends GetxController {
  final FetchQuestUseCase _fetchQuestUseCase;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  QuestDetailScreenController({
    required FetchQuestUseCase fetchQuestUseCase,
  }) : _fetchQuestUseCase = fetchQuestUseCase;

  void onAcceptQuestButtonTap(BuildContext context) {
    Get.bottomSheet(
      Material(
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
              Text('What Should I Do?',
                  textAlign: TextAlign.center, style: MyTextStyles.Medium_w800),
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
              Container(
                height: 56,
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MyColors.Dim200,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    child: Text(
                      'Confirm',
                      style: MyTextStyles.Medium_w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> get instructions => quest.instruction.split(', ');

  final QuestSummary questSummary = Get.arguments as QuestSummary;
  late final Quest quest;

  bool isLoading = true;

  @override
  void onInit() async {
    super.onInit();
    await _fetchQuestUseCase(
        id: questSummary.id,
        onSuccess: (quest) {
          this.quest = quest;
        },
        onFail: () {
          print('실패');
        });
    isLoading = false;
    update();
  }
}

class _CustomListTile extends StatelessWidget {
  final int index;
  final String text;

  const _CustomListTile({
    required this.index,
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
            (index + 1).toString(),
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
