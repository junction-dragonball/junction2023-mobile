import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MyColors.Dim200,
                  ),
                  child: IconButton(
                    onPressed: Get.back,
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Spacer(),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MyColors.Dim200,
                  ),
                  child: IconButton(
                    onPressed: Get.back,
                    icon: Icon(Icons.ios_share_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64);
}
