import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/restaurant.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_restaurants_use_case.dart';
import 'package:yummy_quest/app/presentation/screens/main_indexed_stack_screen/main_indexed_stack_screen_controller.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/app/presentation/widgets/success_dialog.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';
import 'package:intl/intl.dart';

class RestaurantDetailScreenController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  RestaurantDetailScreenController({
    required FetchRestaurantsUseCase fetchRestaurantsUseCase,
  });

  void onCheckoutButtonTap() {
    Get.back();
    Future.delayed(Duration(seconds: 1)).then((value) => Get.back());
    Get.dialog(
      SuccessDialog(text: 'Claimed Coupon!'),
      barrierDismissible: false,
    );
  }

  void onAcceptRestaurantButtonTap(BuildContext context) {
    Get.bottomSheet(Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: MyColors.White,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Buy Coupon', textAlign: TextAlign.center, style: MyTextStyles.Medium_w800),
            Container(
                margin: EdgeInsets.only(top: 24, bottom: 40),
                padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24),
                height: 144,
                decoration: BoxDecoration(
                  color: MyColors.Gray50,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                      NumberFormat.simpleCurrency(locale: 'ko_KR')
                              .format(this.restaurant.originalPrice) +
                          ' Coupon',
                      style: MyTextStyles.Medium_w600),
                  Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          GapRow(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            gap: 4,
                            children: [
                              Icon(
                                Icons.ac_unit_sharp,
                                size: 16,
                                color: MyColors.Orange,
                              ),
                              Text(
                                this.getDiscountRate(
                                    this.finalPrice, this.restaurant.originalPrice),
                                style: MyTextStyles.Medium_w800.copyWith(color: MyColors.Orange),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  this.formatPrice(this.finalPrice),
                                  style: MyTextStyles.Medium_w800,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: MyColors.Orange,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                                child: GapRow(
                                  gap: 4,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 12,
                                      height: 12,
                                      child: Image.asset('assets/icons/gem.png'),
                                    ),
                                    Obx(
                                      () => Text(
                                        this.formatPrice(this.points),
                                        style: MyTextStyles.Small_w800.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          GapRow(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            gap: 8,
                            children: [
                              GapRow(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                gap: 4,
                                children: [
                                  Icon(
                                    Icons.ac_unit_sharp,
                                    size: 16,
                                    color: MyColors.Dim600,
                                  ),
                                  Text(
                                    this.getDiscountRate(this.restaurant.discountPrice,
                                        this.restaurant.originalPrice),
                                    style:
                                        MyTextStyles.Medium_w800.copyWith(color: MyColors.Dim600),
                                  ),
                                ],
                              ),
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(
                                  this.formatPrice(this.restaurant.discountPrice),
                                  style: MyTextStyles.Medium_w600.copyWith(
                                      color: MyColors.Dim600,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Text(
                                  this.formatPrice(this.restaurant.originalPrice),
                                  style: MyTextStyles.Small_w600.copyWith(
                                      color: MyColors.Dim600,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ]),
                            ],
                          )
                        ],
                      ))
                ])),
            GestureDetector(
              onTap: onCheckoutButtonTap,
              child: Container(
                height: 56,
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MyColors.Black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Text(
                  'Checkout ₩' + formatPrice(this.finalPrice),
                  style: MyTextStyles.Medium_w600.copyWith(color: MyColors.White),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  final String restaurantId = Get.arguments[0] as String;
  final int minutes = Get.arguments[1] as int;
  final Restaurant restaurant = Get.arguments[2] as Restaurant;

  int get points => Get.find<MainIndexedStackScreenController>().user.value.points;
  late final int finalPrice;

  String getDiscountRate(int real, int nominal) {
    return ((1 - (real / nominal)) * 100).toStringAsFixed(0) + '%';
  }

  String formatPrice(int price) {
    final NumberFormat _compactFormatter = NumberFormat.decimalPattern();
    return _compactFormatter.format(price);
  }

  @override
  void onInit() async {
    super.onInit();
    this.finalPrice = this.restaurant.discountPrice - points;
    update();
  }
}
