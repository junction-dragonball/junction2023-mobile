import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'my_page_screen_controller.dart';

class MyPageScreen extends GetView<MyPageScreenController> {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('my_page')),
      body: Text('my_page'),
    );
  }
}
