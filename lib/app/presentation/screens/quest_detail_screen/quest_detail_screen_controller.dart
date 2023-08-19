import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';
import 'package:yummy_quest/app/domain/use_cases/confirm_quest_use_case.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_quest_use_case.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';

part 'guide_bottom_sheet.dart';

class QuestDetailScreenController extends GetxController {
  final FetchQuestUseCase _fetchQuestUseCase;
  final ConfirmQuestUseCase _confirmQuestUseCase;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  QuestDetailScreenController({
    required FetchQuestUseCase fetchQuestUseCase,
    required ConfirmQuestUseCase confirmQuestUseCase,
  })  : _fetchQuestUseCase = fetchQuestUseCase,
        _confirmQuestUseCase = confirmQuestUseCase;

  List<String> get instructions => quest.instruction.split(', ');

  bool get isNotStarted => quest.status == "NOT_STARTED";
  bool get isInProgress =>  quest.status == "IN_PROGRESS";
  bool get isCompleted => quest.status == "COMPLETED";

  final QuestSummary questSummary = Get.arguments as QuestSummary;
  late Quest quest;

  bool isLoading = true;

  void onAcceptQuestButtonTap(BuildContext context) {
    Get.bottomSheet(
      _GuideBottomSheetDialog(
        onConfirmTap: onConfirmTap,
        instructions: instructions,
      ),
    );
  }

  void onConfirmTap() async {
    isLoading = true;
    update();
    await _confirmQuestUseCase(
      questId: quest.id,
      onSuccess: (quest) {
        this.quest = quest;
        Get.back();
      },
      onFail: () {
        print('confirmQuestUseCase 실패');
      },
    );
    isLoading = false;
    update();
  }

  @override
  void onReady() async {
    super.onReady();
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
