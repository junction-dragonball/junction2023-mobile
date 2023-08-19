import 'package:flutter/material.dart';

class ColorPixel {
  static const error = Color(0x66FF00FF);
  static const debug = Color(0x6600FFFF);

  static const Color transparent = Color(0x00000000);

  static const Color black = Color(0xFF0F0F0F);
  static const Color white = Color(0xFFFEFEFF);

  static const Color blue = Color(0xFF6865F4);
  static const Color green = Color(0xFF1A6F46);
  static const Color paleGreen = Color(0xFFDDF8EB);
  static const Color orange = Color(0xFFF36841);
  static const Color lightYellow = Color(0xFFFFF0C1);
  static const Color paleYellow = Color(0xFFFFF9E5);
  static const Color red = Color(0xFFF45F57);
  static const Color yellow = Color(0xFFFAE5A1);

  static final SwatchPixel gray = SwatchPixel(
    500,
    const <int, Color>{
      50: Color(0xFFF3F3F4),
      100: Color(0xFFE4E4E6),
      200: Color(0xFFD1D1D2),
      300: Color(0xFFBCBCBF),
      400: Color(0xFF919194),
      500: Color(0xFF737375),
      600: Color(0xFF515153),
      700: Color(0xFF3A3A3C),
      800: Color(0xFF2A2A2B),
      900: Color(0xFF1A1B1B),
    },
  );

  static final SwatchPixel dim = SwatchPixel(
    500,
    const <int, Color>{
      100: Color(0xD8FDFDFE),
      200: Color(0xCCE5E5E6),
      300: Color(0xBFD1D1D2),
      400: Color(0x99919194),
      500: Color(0x99737376),
      600: Color(0x993B3B3D),
      700: Color(0xBF2A2A2C),
      800: Color(0xD81B1B1C),
      900: Color(0xE50F0F0F),
    },
  );
}

class SwatchPixel extends ColorSwatch<int> {
  SwatchPixel(int defaultShade, Map<int, Color> swatch)
      : super(swatch[defaultShade]!.value, swatch);

  final Color error = const Color(0x66FF00FF);

  // Define shades
  Color get shade100 => this[100] ?? error;
  Color get shade200 => this[200] ?? error;
  Color get shade300 => this[300] ?? error;
  Color get shade400 => this[400] ?? error;
  Color get shade500 => this[500] ?? error;
  Color get shade600 => this[600] ?? error;
  Color get shade700 => this[700] ?? error;
  Color get shade800 => this[800] ?? error;
  Color get shade900 => this[900] ?? error;

  // Define extra shades
  Color get shade50 => this[50] ?? error;
  Color get shade150 => this[150] ?? error;
  Color get shade250 => this[250] ?? error;
  Color get shade350 => this[350] ?? error;
  Color get shade450 => this[450] ?? error;
  Color get shade550 => this[550] ?? error;
  Color get shade650 => this[650] ?? error;
  Color get shade750 => this[750] ?? error;
  Color get shade850 => this[850] ?? error;
  Color get shade950 => this[950] ?? error;
}
