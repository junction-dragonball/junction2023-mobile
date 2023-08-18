import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'yummy_quest_screen_controller.dart';

class YummyQuestScreen extends GetView<YummyQuestScreenController> {
  const YummyQuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('yummy_quest')),
      body: Text('yummy_quest'),
    );
  }
}