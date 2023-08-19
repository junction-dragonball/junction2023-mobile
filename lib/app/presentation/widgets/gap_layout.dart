import 'package:flutter/material.dart';

class GapColumn extends StatelessWidget {
  final double gap;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final EdgeInsetsGeometry padding;
  final List<Widget> children;

  /// Gap을 사용한다는 것은 MainAxisAlignment가 필요하지 않다는 것을 의미한다.
  const GapColumn({
    Key? key,
    required this.gap,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.padding = EdgeInsets.zero,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gapChildren = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      gapChildren.add(children[i]);
      if (i != children.length - 1) {
        gapChildren.add(SizedBox(height: gap));
      }
    }

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: gapChildren,
      ),
    );
  }
}

class GapRow extends StatelessWidget {
  final List<Widget> children;
  final double gap;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry padding;

  const GapRow({
    Key? key,
    required this.gap,
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  /// Gap을 사용한다는 것은 MainAxisAlignment가 필요하지 않다는 것을 의미한다.
  @override
  Widget build(BuildContext context) {
    final gapChildren = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      gapChildren.add(children[i]);
      if (i != children.length - 1) {
        gapChildren.add(SizedBox(width: gap));
      }
    }
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: gapChildren,
      ),
    );
  }
}
