import 'package:flutter/cupertino.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';

abstract class MyTextStyles {
  static const Giant_w400 = TextStyle(
    fontSize: 24,
    height: 36 / 24,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Giant_w600 = TextStyle(
    fontSize: 24,
    height: 36 / 24,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Giant_w800 = TextStyle(
    fontSize: 24,
    height: 36 / 24,
    fontWeight: FontWeight.w800,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Large_w400 = TextStyle(
    fontSize: 20,
    height: 28 / 20,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Large_w600 = TextStyle(
    fontSize: 20,
    height: 28 / 20,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Large_w800 = TextStyle(
    fontSize: 20,
    height: 28 / 20,
    fontWeight: FontWeight.w800,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Medium_w400 = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Medium_w600 = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Medium_w800 = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w800,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Small_w400 = TextStyle(
    fontSize: 13,
    height: 16 / 13,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Small_w600 = TextStyle(
    fontSize: 13,
    height: 16 / 13,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Small_w800 = TextStyle(
    fontSize: 13,
    height: 16 / 13,
    fontWeight: FontWeight.w800,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Tiny_w400 = TextStyle(
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Tiny_w600 = TextStyle(
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Tiny_w800 = TextStyle(
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w800,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const Giant = TextStyle(
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w800,
    leadingDistribution: TextLeadingDistribution.even,
  );
}

extension MyTextStylesExtension on TextStyle {
  TextStyle get white => copyWith(color: MyColors.White);
  TextStyle get Dim600 => copyWith(color: MyColors.Dim600);
}