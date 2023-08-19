import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
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
        body: Stack(
          children: [
            SingleChildScrollView(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                  onTap: () {
                    controller.onAcceptQuestButtonTap(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 24,
                    ),
                    color: Colors.black,
                    child: Text(
                      '퀘스트 수락',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
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
          DifficultyChip(difficulty: controller.questSummary.difficulty),
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
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.Orange,
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
                    child: Image.asset('assets/icons/gem.png'),
                  ),
                  Text('140', style: MyTextStyles.Large_w800.white),
                ],
              ),
            ),
          ),
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

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
                color: MyColors.Dim200,
              ),
              child: IconButton(
                onPressed: Get.back,
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Spacer(),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MyColors.Dim200,
              ),
              child: IconButton(
                onPressed: Get.back,
                icon: Icon(Icons.ios_share_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(64);
}

class DifficultyChip extends StatelessWidget {
  final int difficulty;

  const DifficultyChip({
    required this.difficulty,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _backgroundColors = [
      Color(0xFFDAEDEB),
      Color(0xFFF3FAEE),
      Color(0xFFFFF4EA),
      Color(0xFFFEE3E3)
    ];
    final _textColors = [
      Color(0xFF3DAB9E),
      Color(0xFF70A64A),
      Color(0xFFF89132),
      Color(0xFFE84545)
    ];
    final _texts = ['EASY', 'NORMAL', 'HARD', 'VERY HARD'];

    return CustomChip(
      backgroundColor: _backgroundColors[difficulty - 2],
      textColor: _textColors[difficulty - 2],
      text: _texts[difficulty - 2],
      isLarge: true,
    );
  }
}

class CustomChip extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final isLarge;

  const CustomChip({
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.isLarge = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isLarge ? 32 : 24,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          text,
          style: isLarge
              ? MyTextStyles.Small_w800.copyWith(color: textColor)
              : MyTextStyles.Tiny_w800.copyWith(color: textColor),
        ),
      ),
    );
  }
}
