import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yummy_quest/pixels/components/button.dart';
import 'package:yummy_quest/pixels/elements/icon.dart';
import 'package:yummy_quest/pixels/styles/color.dart';
import 'package:yummy_quest/pixels/styles/letter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  void onShare() {
    Share.share(
      'Be together with your friends! Achieve quests and get coupons with Yummy Quest! 😍',
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButtonPixel(
                      priority: ButtonPriority.secondary,
                      customButtonColor: ColorPixel.dim.shade200,
                      icon: IconName.PREV,
                      onPress: Get.back,
                    ),
                    Spacer(),
                    IconButtonPixel(
                      priority: ButtonPriority.secondary,
                      customButtonColor: ColorPixel.dim.shade200,
                      icon: IconName.SHARE,
                      onPress: onShare,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(64);
}

class CustomBottomNavWidget extends StatefulWidget {
  const CustomBottomNavWidget({
    super.key,
    required this.current,
    required this.onTap,
  });

  final int current;
  final void Function(int) onTap;

  @override
  State<CustomBottomNavWidget> createState() => _CustomBottomNavWidgetState();
}

class _CustomBottomNavWidgetState extends State<CustomBottomNavWidget> {
  final List<TabData> _tabData = [
    TabData(title: 'Home', icon: IconName.HOME),
    TabData(title: 'Market', icon: IconName.MARKET),
    TabData(title: 'Profile', icon: IconName.USER),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 72,
      color: ColorPixel.gray.shade900,
      padding: EdgeInsets.fromLTRB(48, 14, 48, 10 + Get.mediaQuery.padding.bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < _tabData.length; i++)
            CustomBottomNavItem(
              icon: _tabData[i].icon,
              title: _tabData[i].title,
              onTap: widget.onTap,
              index: i,
              isCurrent: i == widget.current,
            )
        ],
      ),
    );
  }
}

class CustomBottomNavItem extends StatefulWidget {
  const CustomBottomNavItem({
    super.key,
    this.isCurrent = false,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.index,
  });

  final bool isCurrent;
  final IconName icon;
  final String title;
  final void Function(int) onTap;
  final int index;

  @override
  State<CustomBottomNavItem> createState() => _CustomBottomNavItemState();
}

class _CustomBottomNavItemState extends State<CustomBottomNavItem> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isCurrent ? ColorPixel.orange : ColorPixel.dim.shade400;

    void _onTap() {
      HapticFeedback.lightImpact();

      widget.onTap(widget.index);
    }

    void _onTapUp(_) {
      setState(() {
        isTapped = false;
      });
    }

    void _onTapCancel() {
      setState(() {
        isTapped = false;
      });
    }

    void _onTapDown(_) {
      setState(() {
        isTapped = true;
      });
    }

    return GestureDetector(
      onTap: _onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: isTapped ? 0.85 : 1,
        curve: Curves.easeOutBack,
        duration: const Duration(milliseconds: 150),
        child: SizedBox.square(
          dimension: 48,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconPixel(
                name: widget.icon,
                size: 28,
                color: color,
              ),
              const SizedBox.square(dimension: 4),
              Text(
                widget.title,
                style: widget.isCurrent
                    ? LetterPixel.tiny.black.withColor(color)
                    : LetterPixel.tiny.regular.withColor(color),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabData {
  const TabData({
    required this.title,
    required this.icon,
  });

  final String title;
  final IconName icon;
}
