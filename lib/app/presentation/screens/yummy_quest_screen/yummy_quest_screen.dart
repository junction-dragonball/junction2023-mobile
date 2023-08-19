import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.quests.length,
        itemBuilder: (BuildContext ctx, int index) {
          final quest = controller.quests[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    color: Colors.black12,
                    child: GapColumn(
                      gap: 2,
                      padding: const EdgeInsets.all(12),
                      children: [
                        Text(quest.title),
                        Expanded(
                          child: Text(
                            quest.description,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GapRow(
                              gap: 2,
                              children: List.generate(
                                5,
                                (index) => Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index + 1 <= quest.reward ? Colors.grey : Colors.white,
                                    border: Border.all(width: 1, color: Colors.grey),
                                  ),
                                  width: 16,
                                  height: 16,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              color: Colors.blue,
                              child: Text(quest.status.text),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
