import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/difficulty_circles.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'yummy_quest_screen_controller.dart';

class YummyQuestScreen extends GetView<YummyQuestScreenController> {
  const YummyQuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('yummy_quest'),
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
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  controller.onQuestTap(index);
                },
                child: Row(
                  children: [
                    Hero(
                      tag: questSummaries.id,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              questSummaries.thumbnailUrl,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        color: Colors.black12,
                        child: GapColumn(
                          gap: 2,
                          padding: const EdgeInsets.all(12),
                          children: [
                            Text(questSummaries.title),
                            Expanded(
                              child: Text(
                                questSummaries.shortDescription,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DifficultyCircles(
                                  difficulty: questSummaries.difficulty,
                                  radius: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  color: Colors.blue,
                                  // TODO: Quest 모델 만들어야함.
                                  child: Text('IN PROGRESS'),
                                  // child: Text(quest.status.text),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
