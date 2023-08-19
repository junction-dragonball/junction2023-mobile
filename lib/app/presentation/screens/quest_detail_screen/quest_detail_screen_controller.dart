import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';
import 'package:yummy_quest/app/domain/use_cases/confirm_quest_use_case.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_quest_use_case.dart';
import 'package:yummy_quest/app/domain/use_cases/get_reward_use_case.dart';
import 'package:yummy_quest/app/domain/use_cases/take_a_photo_use_case.dart';
import 'package:yummy_quest/app/presentation/widgets/custom_list_tile.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';

part 'guide_bottom_sheet.dart';

class QuestDetailScreenController extends GetxController {
  final FetchQuestUseCase _fetchQuestUseCase;
  final ConfirmQuestUseCase _confirmQuestUseCase;
  final GetRewardUseCase _getRewardUseCase;
  final TakeAPhotoUseCase _takeAPhotoUseCase;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  QuestDetailScreenController({
    required FetchQuestUseCase fetchQuestUseCase,
    required ConfirmQuestUseCase confirmQuestUseCase,
    required TakeAPhotoUseCase takeAPhotoUseCase,
    required GetRewardUseCase getRewardUseCase,
  })  : _fetchQuestUseCase = fetchQuestUseCase,
        _confirmQuestUseCase = confirmQuestUseCase,
        _takeAPhotoUseCase = takeAPhotoUseCase,
        _getRewardUseCase = getRewardUseCase;

  List<String> get instructions => quest.instruction.split(', ');

  bool get isNotStarted => quest.status == "NOT_STARTED";

  bool get isInProgress => quest.status == "IN_PROGRESS";

  bool get isCompleted => quest.status == "COMPLETED";

  final questSummary = (Get.arguments as Map<String, dynamic>)['questSummary'] as QuestSummary;
  final String heroSuffix =  (Get.arguments as Map<String, dynamic>)['heroSuffix'] as String;
  String get heroTag => 'quest${questSummary.id}$heroSuffix';
  late Quest quest;

  bool isLoading = true;

  void onGetRewardButtonTap(BuildContext context) async {
    await TakeAPhotoUseCase()(
      onFail: () {
        print('fail');
      },
      onSuccess: (file) async {
        isLoading = true;
        update();
        await _getRewardUseCase(
          questId: quest.id,
          onSuccess: (quest) {
            this.quest = quest;
            Get.back();
            Future.delayed(Duration(seconds: 1)).then((value) => Get.back());
            Get.dialog(
              Center(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 160,
                    height: 160,
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    decoration: BoxDecoration(
                      color: MyColors.White,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GapColumn(
                      gap: 16,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/green_filled_check.png',
                          width: 64,
                          height: 64,
                        ),
                        Text('Quest is Completed!',style: MyTextStyles.Small_w800),
                      ],
                    ),
                  ),
                ),
              ),
              barrierDismissible: false,
            );
          },
          onFail: () {
            print('confirmQuestUseCase 실패');
          },
        );
        isLoading = false;
        update();
      },
      onCancel: () {
        print('cancel');
      },
      ctx: context,
    );
  }

  void onAcceptQuestButtonTap(BuildContext context) {
    Get.bottomSheet(
      _GuideBottomSheetDialog(
        onConfirmTap: onConfirmTap,
        instructions: instructions,
      ),
    );
  }

  void onConfirmTap() async {
    isLoading = true;
    update();
    await _confirmQuestUseCase(
      questId: quest.id,
      onSuccess: (quest) {
        this.quest = quest;
        Get.back();
      },
      onFail: () {
        print('confirmQuestUseCase 실패');
      },
    );
    isLoading = false;
    update();
  }

  @override
  void onReady() async {
    super.onReady();
    await _fetchQuestUseCase(
        id: questSummary.id,
        onSuccess: (quest) {
          this.quest = quest;
        },
        onFail: () {
          print('실패');
        });
    isLoading = false;
    update();
  }
}
