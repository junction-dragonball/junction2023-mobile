import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/presentation/screens/my_page_screen/my_page_screen.dart';
import 'package:yummy_quest/app/presentation/screens/yummy_deal_screen/yummy_deal_screen.dart';
import 'package:yummy_quest/app/presentation/screens/yummy_quest_screen/yummy_quest_screen.dart';
import 'package:yummy_quest/app/presentation/widgets/global_widget.dart';

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
        () => CustomBottomNavWidget(
          current: controller.currentIndex.value,
          onTap: controller.onBottomNavItemTap,
        ),
      ),
      /* bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 0,
          currentIndex: controller.currentIndex.value,
          onTap: controller.onBottomNavItemTap,
          backgroundColor: MyColors.Gray900,
          selectedItemColor: MyColors.Orange,
          unselectedItemColor: MyColors.Dim400,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Market'),
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Profile'),
          ],
        ), 
      ), */
    );
  }
}
