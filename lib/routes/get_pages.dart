import 'package:get/route_manager.dart';
import 'package:yummy_quest/app/presentation/screens/main_indexed_stack_screen/main_indexed_stack_screen.dart';
import 'package:yummy_quest/app/presentation/screens/main_indexed_stack_screen/main_indexed_stack_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/my_page_screen/my_page_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/quest_detail_screen/quest_detail_screen.dart';
import 'package:yummy_quest/app/presentation/screens/quest_detail_screen/quest_detail_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/yummy_deal_screen/yummy_deal_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/yummy_quest_screen/yummy_quest_screen_binding.dart';
import 'package:yummy_quest/routes/named_routes.dart';

abstract class GetPages {
  static get pages => [
    GetPage(
      name: RouteNames.MAIN,
      page: () => const MainIndexedStackScreen(),
      bindings: [
        MainIndexedStackScreenBinding(),
        YummyQuestScreenBinding(),
        YummyDealScreenBinding(),
        MyPageScreenBinding(),
      ],
    ),
    GetPage(
      name: RouteNames.MAIN + RouteNames.QUEST_DETAIL,
      page: () => const QuestDetailScreen(),
      binding: QuestDetailScreenBinding(),
    )
  ];
}
