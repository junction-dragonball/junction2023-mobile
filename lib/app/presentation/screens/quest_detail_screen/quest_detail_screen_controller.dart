import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_quest_use_case.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';

class QuestDetailScreenController extends GetxController {
  final FetchQuestUseCase _fetchQuestUseCase;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  QuestDetailScreenController({
    required FetchQuestUseCase fetchQuestUseCase,
  }) : _fetchQuestUseCase = fetchQuestUseCase;

  void onAcceptQuestButtonTap(BuildContext context) {
    Get.bottomSheet(
      Material(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: GapColumn(
            gap: 12,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('어떻게 하면 되나요?', style: TextStyle(fontSize: 24)),
              ...List.generate(instructions.length, (index) {
                return _CustomListTile(
                  index: index,
                  text: instructions[index],
                );
              }).toList(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 24.0,
                ),
                child: GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '확인',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
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
      gap: 4,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 20,
          child: Text(
            (index + 1).toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Expanded(child: Text(text)),
      ],
    );
  }
}
