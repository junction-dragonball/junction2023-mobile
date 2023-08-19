import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/difficulty_circles.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'quest_detail_screen_controller.dart';

class QuestDetailScreen extends GetView<QuestDetailScreenController> {
  const QuestDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: controller.scaffoldKey,
        body: Stack(
          children: [
            Positioned.fill(
              child: SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: GetBuilder<QuestDetailScreenController>(builder: (controller) {
                    final isLoading = controller.isLoading;
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Center(
                                  child: Hero(
                                    tag: 'hi',
                                    child: Image.network(controller.questSummary.thumbnailUrl),
                                  ),
                                ),
                                Positioned(
                                  left: 8,
                                  top: 8,
                                  child: IconButton(
                                    onPressed: Get.back,
                                    icon: Icon(Icons.arrow_back_ios),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  bottom: 20,
                                  child: Container(
                                    color: Colors.grey,
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                        // TODO: Quest 객체로 바꿔야함
                                        'NEW!'
                                        // quest.status.text,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        GapColumn(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          gap: 12,
                          children: [
                            Text(
                              controller.questSummary.title,
                              style: TextStyle(fontSize: 36),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.grey,
                                    padding: const EdgeInsets.all(8),
                                    child: GapColumn(
                                      gap: 8,
                                      children: [
                                        Text('보상'),
                                        GapRow(
                                          gap: 4,
                                          children: [
                                            CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Colors.pink,
                                            ),
                                            Text(isLoading
                                                ? '000'
                                                : controller.quest.reward.toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    color: Colors.grey,
                                    padding: const EdgeInsets.all(8),
                                    child: GapColumn(
                                      gap: 8,
                                      children: [
                                        Text('난이도'),
                                        DifficultyCircles(
                                          difficulty: controller.questSummary.difficulty,
                                          radius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            controller.isLoading
                                ? CircularProgressIndicator()
                                : Text(controller.quest.description),
                          ],
                        ),
                        const SizedBox(height: 48),
                      ],
                    );
                  }),
                ),
              ),
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
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
}
