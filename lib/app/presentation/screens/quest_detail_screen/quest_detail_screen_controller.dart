import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest.dart';

class QuestDetailScreenController extends GetxController{
  final Quest quest = Get.arguments as Quest;
}