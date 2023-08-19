import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/difficulty_circles.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';

// ignore: unused_import
import 'quest_detail_screen_controller.dart';

class QuestDetailScreen extends GetView<QuestDetailScreenController> {
  const QuestDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quest = controller.quest;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: Placeholder(),
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
                            quest.status.text,
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
                    quest.title,
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
                                  Text(quest.reward.toString()),
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
                              Text('보상'),
                              DifficultyCircles(
                                difficulty: quest.difficulty,
                                radius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(quest.description),
                  Text(
                    'ㅁㄴ어ㅣ럼ㄴㅇ롬ㄴ왬ㅇㄴ럼ㄴㅇ럼ㄴ어리ㅓㅏㅁ나ㅣ;ㅇ러;ㅣㅏㅁㄴ얼;ㅏㅣ먼일;ㅏㅓㅁ나;ㅣㅇ러ㅣㅏ;ㄴㅁ어리ㅏ넘이ㅏ러만어럄더ㅐ챠ㅐ믄이ㅏㅊ넘ㅇ처;ㅐㅑㅈ;ㅡㅁㄷ차ㅡㅁㄴ아츠ㅏㄴ'
                    'ㅁㄴ어ㅣ럼ㄴㅇ롬ㄴ왬ㅇㄴ럼ㄴㅇ럼ㄴ어리ㅓㅏㅁ나ㅣ;ㅇ러;ㅣㅏㅁㄴ얼;ㅏㅣ먼일;ㅏㅓㅁ나;ㅣㅇ러ㅣㅏ;ㄴㅁ어리ㅏ넘이ㅏ러만어럄더ㅐ챠ㅐ믄이ㅏㅊ넘ㅇ처;ㅐㅑㅈ;ㅡㅁㄷ차ㅡㅁㄴ아츠ㅏㄴ'
                    'ㅁㄴ어ㅣ럼ㄴㅇ롬ㄴ왬ㅇㄴ럼ㄴㅇ럼ㄴ어리ㅓㅏㅁ나ㅣ;ㅇ러;ㅣㅏㅁㄴ얼;ㅏㅣ먼일;ㅏㅓㅁ나;ㅣㅇ러ㅣㅏ;ㄴㅁ어리ㅏ넘이ㅏ러만어럄더ㅐ챠ㅐ믄이ㅏㅊ넘ㅇ처;ㅐㅑㅈ;ㅡㅁㄷ차ㅡㅁㄴ아츠ㅏㄴ'
                    'ㅁㄴ어ㅣ럼ㄴㅇ롬ㄴ왬ㅇㄴ럼ㄴㅇ럼ㄴ어리ㅓㅏㅁ나ㅣ;ㅇ러;ㅣㅏㅁㄴ얼;ㅏㅣ먼일;ㅏㅓㅁ나;ㅣㅇ러ㅣㅏ;ㄴㅁ어리ㅏ넘이ㅏ러만어럄더ㅐ챠ㅐ믄이ㅏㅊ넘ㅇ처;ㅐㅑㅈ;ㅡㅁㄷ차ㅡㅁㄴ아츠ㅏㄴ'
                    'ㅁㄴ어ㅣ럼ㄴㅇ롬ㄴ왬ㅇㄴ럼ㄴㅇ럼ㄴ어리ㅓㅏㅁ나ㅣ;ㅇ러;ㅣㅏㅁㄴ얼;ㅏㅣ먼일;ㅏㅓㅁ나;ㅣㅇ러ㅣㅏ;ㄴㅁ어리ㅏ넘이ㅏ러만어럄더ㅐ챠ㅐ믄이ㅏㅊ넘ㅇ처;ㅐㅑㅈ;ㅡㅁㄷ차ㅡㅁㄴ아츠ㅏㄴ'
                    'ㅁㄴ어ㅣ럼ㄴㅇ롬ㄴ왬ㅇㄴ럼ㄴㅇ럼ㄴ어리ㅓㅏㅁ나ㅣ;ㅇ러;ㅣㅏㅁㄴ얼;ㅏㅣ먼일;ㅏㅓㅁ나;ㅣㅇ러ㅣㅏ;ㄴㅁ어리ㅏ넘이ㅏ러만어럄더ㅐ챠ㅐ믄이ㅏㅊ넘ㅇ처;ㅐㅑㅈ;ㅡㅁㄷ차ㅡㅁㄴ아츠ㅏㄴ',
                  ),
                ],
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        color: Colors.transparent,
        padding: const EdgeInsets.all(24.0),
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
    );
  }
}
