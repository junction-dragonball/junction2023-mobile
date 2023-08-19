import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
        backgroundColor: Colors.transparent,
        title: Text('Quests 📜',
            style: MyTextStyles.Giant_w800.copyWith(color: MyColors.White)),
        actions: [
          Center(
            child: Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.White,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(children: [
                  Icon(Icons.circle),
                  Text('480'),
                ]),
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
                                Text(questSummaries.title,
                                    style: MyTextStyles.Medium_w600),
                                SizedBox(height: 4),
                                Text(
                                  questSummaries.shortDescription,
                                  overflow: TextOverflow.clip,
                                  style: MyTextStyles.Small_w400.copyWith(
                                      color: MyColors.Dim600),
                                  maxLines: 2,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    if (questSummaries.id == '1') ...[
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFA660FF),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Text('New',
                                            style:
                                                MyTextStyles.Tiny_w800.copyWith(
                                                    color: MyColors.White)),
                                      ),
                                      SizedBox(width: 4)
                                    ],
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                            color: Color(questSummaries
                                                        .difficulty ==
                                                    1
                                                ? 0xFFDAEDEB
                                                : questSummaries.difficulty == 2
                                                    ? 0xFFF3FAEE
                                                    : questSummaries
                                                                .difficulty ==
                                                            3
                                                        ? 0xFFFFF4EA
                                                        : 0xFFFEE3E3),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Text(
                                            questSummaries.difficulty == 1
                                                ? 'EASY'
                                                : questSummaries.difficulty == 2
                                                    ? 'NORMAL'
                                                    : questSummaries
                                                                .difficulty ==
                                                            3
                                                        ? 'HARD'
                                                        : 'VERY HARD',
                                            style:
                                                MyTextStyles.Tiny_w800.copyWith(
                                                    color: Color(questSummaries
                                                                .difficulty ==
                                                            1
                                                        ? 0xFF3DAB9E
                                                        : questSummaries
                                                                    .difficulty ==
                                                                2
                                                            ? 0xFF70A64A
                                                            : questSummaries
                                                                        .difficulty ==
                                                                    3
                                                                ? 0xFFF89132
                                                                : 0xFFE84545))))
                                  ],
                                )
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
