import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';
import 'package:yummy_quest/app/presentation/screens/main_indexed_stack_screen/main_indexed_stack_screen_controller.dart';
import 'package:yummy_quest/app/presentation/widgets/chip.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';
import 'package:yummy_quest/pixels/components/button.dart';
import 'package:yummy_quest/pixels/styles/color.dart';
import 'package:yummy_quest/pixels/styles/letter.dart';

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
          title: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onLongPress: () {
                controller.onResetQuest();
              },
              child: Text('Quests 📜',
                  style: MyTextStyles.Giant_w800.copyWith(color: MyColors.White))),
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
                      child: Obx(
                    () => Text(
                      Get.find<MainIndexedStackScreenController>().user.value.points.toString(),
                      style: MyTextStyles.Medium_w800.copyWith(color: MyColors.White),
                    ),
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
          itemCount: questSummaries.length + 1,
          itemBuilder: (BuildContext ctx, int index) {
            if (index < questSummaries.length) {
              final quest = questSummaries[index];
              return QuestWidget(
                quest: quest,
                onTap: () {
                  controller.onQuestTap(index);
                },
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 40, 40, 24),
                  child: Text(
                    'This is the end of Quest List\nGet notification for the new quests',
                    style: LetterPixel.small.regular.withColor(ColorPixel.dim.shade400),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(64, 0, 64, 48),
                  child: ButtonPixel(
                    customButtonColor: ColorPixel.dim.shade500,
                    customContentColor: ColorPixel.dim.shade200,
                    priority: ButtonPriority.secondary,
                    label: 'Notify New Quests!',
                    onPress: () {},
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}

class QuestWidget extends StatefulWidget {
  const QuestWidget({
    super.key,
    required this.quest,
    this.onTap,
  });

  final QuestSummary quest;
  final void Function()? onTap;

  @override
  State<QuestWidget> createState() => _QuestWidgetState();
}

class _QuestWidgetState extends State<QuestWidget> {
  bool isTapped = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _onTap() {
    HapticFeedback.mediumImpact();

    widget.onTap?.call();
  }

  void _onTapDown(_) {
    setState(() {
      isTapped = true;
    });
  }

  void _onTapUp(_) {
    setState(() {
      isTapped = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      isTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isCompleted = widget.quest.status == "COMPLETED";
    return Padding(
      key: ValueKey(widget.quest.id),
      padding: const EdgeInsets.only(bottom: 2.0),
      child: IgnorePointer(
        ignoring: isCompleted,
        child: GestureDetector(
          onTap: _onTap,
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          child: Opacity(
            opacity: isCompleted ? 0.65 : 1,
            child: AnimatedScale(
              scale: isTapped ? 0.95 : 1,
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeOutBack,
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
                        tag: 'quest' + widget.quest.id + 'first',
                        child: Container(
                          height: 64,
                          width: 64,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.quest.thumbnailUrl,
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
                              Text(widget.quest.title.replaceAll('(Ad)', ''),
                                  style: MyTextStyles.Medium_w600),
                              SizedBox(height: 4),
                              SizedBox(
                                  height: 32,
                                  child: Text(
                                    widget.quest.shortDescription.replaceAll('(Ad)', ''),
                                    overflow: TextOverflow.clip,
                                    style: MyTextStyles.Small_w400.copyWith(color: MyColors.Dim600),
                                    maxLines: 2,
                                  )),
                              SizedBox(height: 20),
                              GapRow(
                                gap: 4,
                                children: [
                                  if (widget.quest.isNew)
                                    CustomChip(
                                      backgroundColor: Color(0xFFA660FF),
                                      textColor: MyColors.White,
                                      text: 'NEW',
                                    ),
                                  if (widget.quest.isAd)
                                    CustomChip(
                                      backgroundColor: Color(0xFFEDEDED),
                                      textColor: Color(0xFF7E7E7E),
                                      text: 'AD',
                                    ),
                                  DifficultyChip(difficulty: widget.quest.difficulty),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
