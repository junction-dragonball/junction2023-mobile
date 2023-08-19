import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/difficulty_circles.dart';
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
        title: Text('Quests'),
        centerTitle: true,
        actions: [
          Center(
            child: Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(4),
              child: GapRow(
                gap: 2,
                children: [
                  Icon(Icons.circle),
                  Text('480'),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: GetBuilder<YummyQuestScreenController>(builder: (controller) {
        if (controller.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.questSummaries.length,
          itemBuilder: (BuildContext ctx, int index) {
            final questSummaries = controller.questSummaries[index];
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
                          tag: questSummaries.id,
                          child: Container(
                            height: 64,
                            width: 64,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              image: DecorationImage(
                                image: NetworkImage(
                                  questSummaries.thumbnailUrl,
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
                                Text(questSummaries.title, style: MyTextStyles.Medium_w600),
                                SizedBox(height: 4),
                                Text(
                                  questSummaries.shortDescription,
                                  overflow: TextOverflow.clip,
                                  style: MyTextStyles.Small_w400.copyWith(color: MyColors.Dim600),
                                  maxLines: 2,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    DifficultyCircles(
                                      difficulty: questSummaries.difficulty,
                                      radius: 10,
                                    ),
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
