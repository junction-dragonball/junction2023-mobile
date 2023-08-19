import 'package:flutter/widgets.dart';
import 'package:yummy_quest/pixels/styles/color.dart';

part 'icon_data.dart';

class IconPixel extends StatelessWidget {
  const IconPixel({
    super.key,
    required this.name,
    this.size = 24,
    this.color = ColorPixel.debug,
  });

  final IconName name;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final List<int> iconCodes = IconMap.get(name.str);

    return SizedBox(
      width: size,
      height: size,
      child: Text(
        String.fromCharCodes(iconCodes),
        style: TextStyle(
          inherit: false,
          color: color,
          fontSize: size,
          fontWeight: FontWeight.normal,
          height: 1,
          fontFamily: 'YummyIcon',
        ),
      ),
    );
  }
}
