import 'dart:ui';

import 'package:flutter/material.dart';

class LetterPixel {
  static const TextStyle _base = TextStyle(
    decoration: TextDecoration.none,
    decorationStyle: TextDecorationStyle.solid,
    fontWeight: FontWeight.w400,
    fontFeatures: [FontFeature.caseSensitiveForms()],
    leadingDistribution: TextLeadingDistribution.even,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
    // backgroundColor: kDebugMode ? ColorPixel.debug : null,
  );

  static final TextStyle tiny = _base.merge(const TextStyle(fontSize: 11, height: 16 / 11));
  static final TextStyle small = _base.merge(const TextStyle(fontSize: 13, height: 20 / 13));
  static final TextStyle medium = _base.merge(const TextStyle(fontSize: 16, height: 24 / 16));
  static final TextStyle large = _base.merge(const TextStyle(fontSize: 20, height: 28 / 20));
  static final TextStyle giant = _base.merge(const TextStyle(fontSize: 28, height: 40 / 28));
}

extension TextStyleExt on TextStyle {
  // Apply color
  TextStyle withColor(Color color) => apply(color: color, decorationColor: color);

  // Apply underline
  TextStyle get underlined => apply(decoration: TextDecoration.underline);
  TextStyle get striked => apply(decoration: TextDecoration.lineThrough);

  // Apply weights
  TextStyle get regular => this.copyWith(fontWeight: FontWeight.w400);
  TextStyle get bold => this.copyWith(fontWeight: FontWeight.w600);
  TextStyle get black => this.copyWith(fontWeight: FontWeight.w800);
}
