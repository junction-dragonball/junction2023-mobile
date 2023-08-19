import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/presentation/widgets/chip.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';

import 'yummy_quest_screen_controller.dart';

class YummyQuestScreen extends GetView<YummyQuestScreenController> {
  const YummyQuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 64,
          backgroundColor: Colors.transparent,
          title: Text('Quests 📜', style: MyTextStyles.Giant_w800.copyWith(color: MyColors.White)),
          actions: [
            Center(
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: MyColors.Dim600,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(children: [
                  Image.asset(
                    'assets/icons/gem.png',
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(width: 4),
                  Center(
                      child: Text(
                    '480',
                    style: MyTextStyles.Medium_w800.copyWith(color: MyColors.White),
                  )),
                ]),
              ),
            ),
            SizedBox(width: 4),
            Center(
              child: Obx(
                () => GestureDetector(
                  onTap: controller.onActionTap,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: controller.progressQuestCount == 0 ? MyColors.Dim600 : MyColors.Blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        controller.progressQuestCount.toString(),
                        style: MyTextStyles.Medium_w800.copyWith(
                          color: MyColors.White.withOpacity(
                            controller.progressQuestCount == 0 ? 0.45 : 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
          ]),
      body: GetBuilder<YummyQuestScreenController>(builder: (controller) {
        if (controller.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        final questSummaries = controller.questSummaries;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: questSummaries.length,
          itemBuilder: (BuildContext ctx, int index) {
            final quest = questSummaries[index];
            return Padding(
              key: ValueKey(quest.id),
              padding: const EdgeInsets.only(bottom: 2.0),
              child: GestureDetector(
                onTap: () {
                  controller.onQuestTap(index);
                },
                child: Container(
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: MyColors.White,
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        Hero(
                          tag: 'quest' + quest.id,
                          child: Container(
                            height: 64,
                            width: 64,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  quest.thumbnailUrl,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(quest.title, style: MyTextStyles.Medium_w600),
                                SizedBox(height: 4),
                                SizedBox(
                                    height: 32,
                                    child: Text(
                                      quest.shortDescription,
                                      overflow: TextOverflow.clip,
                                      style:
                                          MyTextStyles.Small_w400.copyWith(color: MyColors.Dim600),
                                      maxLines: 2,
                                    )),
                                SizedBox(height: 20),
                                GapRow(
                                  gap: 4,
                                  children: [
                                    if (quest.isNew)
                                      CustomChip(
                                        backgroundColor: Color(0xFFA660FF),
                                        textColor: MyColors.White,
                                        text: 'NEW',
                                      ),
                                    if (quest.isAd)
                                      CustomChip(
                                        backgroundColor: Color(0xFFEDEDED),
                                        textColor: Color(0xFF7E7E7E),
                                        text: 'AD',
                                      ),
                                    DifficultyChip(difficulty: quest.difficulty),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            );
          },
        );
      }),
    );
  }
}
