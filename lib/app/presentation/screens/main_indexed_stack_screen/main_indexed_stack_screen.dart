import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/screens/my_page_screen/my_page_screen.dart';
import 'package:yummy_quest/app/presentation/screens/yummy_deal_screen/yummy_deal_screen.dart';
import 'package:yummy_quest/app/presentation/screens/yummy_quest_screen/yummy_quest_screen.dart';
import 'main_indexed_stack_screen_controller.dart';

class MainIndexedStackScreen extends GetView<MainIndexedStackScreenController> {
  const MainIndexedStackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            YummyQuestScreen(),
            YummyDealScreen(),
            MyPageScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.onBottomNavItemTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: '1'),
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: '2'),
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: '3'),
          ],
        ),
      ),
    );
  }
}