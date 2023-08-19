import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/chip.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';

// ignore: unused_import
import 'in_progress_quest_screen_controller.dart';

class InProgressQuestScreen extends GetView<InProgressQuestScreenController> {
  const InProgressQuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: _CustomAppBar(),
      body: ListView.builder(
        itemCount: controller.questSummaries.length,
        itemBuilder: (BuildContext ctx, int index) {
          final questSummary = controller.questSummaries[index];
          return Padding(
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
                        tag: 'quest' + questSummary.id,
                        child: Container(
                          height: 64,
                          width: 64,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                questSummary.thumbnailUrl,
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
                              Text(questSummary.title, style: MyTextStyles.Medium_w600),
                              SizedBox(height: 4),
                              SizedBox(
                                  height: 32,
                                  child: Text(
                                    questSummary.shortDescription,
                                    overflow: TextOverflow.clip,
                                    style: MyTextStyles.Small_w400.copyWith(color: MyColors.Dim600),
                                    maxLines: 2,
                                  )),
                              SizedBox(height: 20),
                              GapRow(
                                gap: 4,
                                children: [
                                  if (questSummary.isNew)
                                    CustomChip(
                                      backgroundColor: Color(0xFFA660FF),
                                      textColor: MyColors.White,
                                      text: 'NEW',
                                    ),
                                  if (questSummary.isAd)
                                    CustomChip(
                                      backgroundColor: Color(0xFFEDEDED),
                                      textColor: Color(0xFF7E7E7E),
                                      text: 'AD',
                                    ),
                                  DifficultyChip(difficulty: questSummary.difficulty),
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
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MyColors.Dim600,
              ),
              child: IconButton(
                onPressed: Get.back,
                icon: Icon(
                  Icons.arrow_back,
                  color: MyColors.White,
                ),
              ),
            ),
            Spacer(),
            Text('Ongoing Quests 🏎️', style: MyTextStyles.Medium_w800.white),
            Spacer(),
            SizedBox(
              width: 48,
              height: 48,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64);
}
