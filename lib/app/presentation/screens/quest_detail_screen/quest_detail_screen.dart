import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/chip.dart';
import 'package:yummy_quest/app/presentation/widgets/custom_list_tile.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/app/presentation/widgets/global_widget.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';
import 'quest_detail_screen_controller.dart';

class QuestDetailScreen extends GetView<QuestDetailScreenController> {
  const QuestDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: CustomAppBar(),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            SingleChildScrollView(
              padding:
                  EdgeInsets.only(top: 64 + Get.window.padding.top / Get.window.devicePixelRatio),
              child: GetBuilder<QuestDetailScreenController>(builder: (controller) {
                final isLoading = controller.isLoading;
                return Column(
                  children: [
                    _buildImageAndReward(controller),
                    const SizedBox(height: 40),
                    _buildChips(controller),
                    const SizedBox(height: 16),
                    GapColumn(
                      gap: 24,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        GapColumn(
                          gap: 12,
                          children: [
                            Text(
                              controller.questSummary.title.replaceAll('(Ad)', ''),
                              style: MyTextStyles.Giant_w800,
                            ),
                            if (!controller.isLoading && controller.isInProgress)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0),
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: MyColors.Gray50,
                                  ),
                                  child: GapColumn(
                                    gap: 8,
                                    children: [
                                      GapRow(
                                        gap: 8,
                                        children: [
                                          Icon(Icons.flag_outlined),
                                          Text('Instruction', style: MyTextStyles.Medium_w600),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      ...List.generate(controller.instructions.length, (index) {
                                        return CustomListTile(
                                          order: index + 1,
                                          text: controller.instructions[index],
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                ),
                              ),
                            controller.isLoading
                                ? Center(child: CircularProgressIndicator())
                                : Text(
                                    controller.quest.description,
                                    style: MyTextStyles.Medium_w400,
                                  ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: MyColors.Gray100,
                        ),
                        GapColumn(
                          gap: 16,
                          children: [
                            Text('Quest duration', style: MyTextStyles.Large_w600),
                            if (!isLoading)
                              _ContentsBox(
                                iconWidget: Icon(Icons.calendar_today_outlined),
                                title: controller.quest.period == 7
                                    ? '1 Week'
                                    : '${controller.quest.period} Day(s)',
                                content: controller.quest.durationStr,
                              ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: MyColors.Gray100,
                        ),
                        GapColumn(
                          gap: 16,
                          children: [
                            Text('You can achieve with...', style: MyTextStyles.Large_w600),
                            if (!isLoading)
                              _ContentsBox(
                                iconWidget: Icon(Icons.photo_size_select_actual_outlined),
                                title: controller.quest.verifyMethod.title,
                                content: controller.quest.verifyMethod.content,
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    // TODO: delete
                    const SizedBox(height: 100),
                  ],
                );
              }),
            ),
            GetBuilder<QuestDetailScreenController>(builder: (controller) {
              if (!controller.isLoading && !controller.isCompleted){
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: GapColumn(
                    gap: 8,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: MyColors.PaleYellow,
                            ),
                            child: Text(
                              controller.isNotStarted
                                  ? '${controller.quest.inProgressCount} peoples are already in progress 🔥'
                                  : '${controller.quest.completeCount} peoples completed, and got rewards 🎉',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(
                            bottom: 16 + Get.window.padding.bottom / Get.window.devicePixelRatio,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if(controller.isNotStarted) {
                                controller.onAcceptQuestButtonTap(context) ;
                              } else {
                                controller.onGetRewardButtonTap(context) ;
                              }
                            },
                            child: Container(
                              height: 56,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: controller.isNotStarted ? MyColors.Black : MyColors.Blue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  controller.isNotStarted ? 'Accept Quest!' : 'Get Reward!',
                                  style: MyTextStyles.Medium_w600.white,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              } else {
                return SizedBox.shrink();
              }

            }),
          ],
        ),
      ),
    );
  }

  Padding _buildChips(QuestDetailScreenController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: GapRow(
        gap: 4,
        children: [
          if (controller.questSummary.isNew)
            CustomChip(
              backgroundColor: Color(0xFFA660FF),
              textColor: MyColors.White,
              text: 'NEW',
              isLarge: true,
            ),
          if (controller.questSummary.isAd)
            CustomChip(
              backgroundColor: Color(0xFFEDEDED),
              textColor: Color(0xFF7E7E7E),
              text: 'AD',
              isLarge: true,
            ),
          DifficultyChip(
            difficulty: controller.questSummary.difficulty,
            isLarge: true,
          ),
        ],
      ),
    );
  }

  Stack _buildImageAndReward(QuestDetailScreenController controller) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Hero(
              tag: 'quest' + controller.questSummary.id,
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.questSummary.thumbnailUrl),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        GetBuilder<QuestDetailScreenController>(
          builder: (controller) {
            return Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Center(
                child: AnimatedScale(
                  scale: !controller.isLoading ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: !controller.isLoading
                      ? Container(
                          decoration: BoxDecoration(
                            color: controller.isCompleted ? MyColors.Green : MyColors.Orange,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: MyColors.White,
                              width: 4,
                              strokeAlign: 1,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: GapRow(
                            gap: 8,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  controller.isCompleted
                                      ? 'assets/icons/green_check.png'
                                      : 'assets/icons/gem.png',
                                ),
                              ),
                              Text(
                                controller.quest.reward.toString(),
                                style: MyTextStyles.Large_w800.white,
                              ),
                            ],
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _ContentsBox extends StatelessWidget {
  final Widget iconWidget;
  final String title;
  final String content;

  const _ContentsBox({
    required this.iconWidget,
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MyColors.Gray50,
      ),
      child: GapColumn(
        gap: 8,
        children: [
          GapRow(
            gap: 8,
            children: [
              iconWidget,
              Text(title, style: MyTextStyles.Medium_w600),
            ],
          ),
          Text(content, style: MyTextStyles.Small_w400.Dim600),
        ],
      ),
    );
  }
}
