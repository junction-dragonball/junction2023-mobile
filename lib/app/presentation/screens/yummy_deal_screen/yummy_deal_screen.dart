import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'yummy_deal_screen_controller.dart';

class YummyDealScreen extends GetView<YummyDealScreenController> {
  const YummyDealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('yummy_deal')),
      body: Text('yummy_deal'),
    );
  }
}
