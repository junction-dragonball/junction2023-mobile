import 'package:get/route_manager.dart';
import 'package:yummy_quest/app/presentation/screens/in_progress_quest_screen/in_progress_quest_screen.dart';
import 'package:yummy_quest/app/presentation/screens/in_progress_quest_screen/in_progress_quest_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/main_indexed_stack_screen/main_indexed_stack_screen.dart';
import 'package:yummy_quest/app/presentation/screens/main_indexed_stack_screen/main_indexed_stack_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/my_page_screen/my_page_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/quest_detail_screen/quest_detail_screen.dart';
import 'package:yummy_quest/app/presentation/screens/quest_detail_screen/quest_detail_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/restaurant_detail_screen/restaurant_detail_screen.dart';
import 'package:yummy_quest/app/presentation/screens/restaurant_detail_screen/restaurant_detail_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:yummy_quest/app/presentation/screens/splash_screen/splash_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/yummy_deal_screen/yummy_deal_screen_binding.dart';
import 'package:yummy_quest/app/presentation/screens/yummy_quest_screen/yummy_quest_screen_binding.dart';
import 'package:yummy_quest/routes/named_routes.dart';

abstract class GetPages {
  static get pages =>
      [
        GetPage(
          name: RouteNames.SPLASH,
          page: () => const SplashScreen(),
          binding: SplashScreenBinding(),
        ),
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
        ),
        GetPage(
          name: RouteNames.MAIN + RouteNames.IN_PROGRESS_QUEST,
          page: () => const InProgressQuestScreen(),
          binding: InProgressQuestScreenBinding(),
        ),
        GetPage(
          name: RouteNames.MAIN + RouteNames.RESTAURANT_DETAIL,
          page: () => const RestaurantDetailScreen(),
          binding: RestaurantDetailScreenBinding(),
        )
      ];
}
