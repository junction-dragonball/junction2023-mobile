part of 'button.dart';

class ButtonSizeMap {
  static final Map<ButtonSize, double> _data = {
    ButtonSize.large: 56,
    ButtonSize.medium: 48,
    ButtonSize.small: 40,
  };

  static double get(ButtonSize size) {
    return _data[size]!;
  }
}

class ButtonColorMap {
  static final Map<ButtonTheme, Map<ButtonPriority, Color>> _data = {
    ButtonTheme.light: {
      ButtonPriority.primary: ColorPixel.black,
      ButtonPriority.secondary: ColorPixel.dim.shade300,
      ButtonPriority.tertiary: ColorPixel.dim.shade300,
      ButtonPriority.optional: ColorPixel.transparent,
    },
    ButtonTheme.dark: {
      ButtonPriority.primary: ColorPixel.black,
      ButtonPriority.secondary: ColorPixel.dim.shade300,
      ButtonPriority.tertiary: ColorPixel.dim.shade300,
      ButtonPriority.optional: ColorPixel.transparent,
    }
  };

  static Color get(ButtonPriority priority, [ButtonTheme theme = ButtonTheme.light]) {
    return _data[theme]![priority]!;
  }
}

class ButtonDisabledColorMap {
  static final Map<ButtonTheme, Color> _data = {
    ButtonTheme.light: ColorPixel.dim.shade300,
    ButtonTheme.dark: ColorPixel.dim.shade300,
  };

  static Color get(ButtonTheme theme) {
    return _data[theme]!;
  }
}

class ButtonIconSizeMap {
  static final Map<ButtonSize, double> _data = {
    ButtonSize.large: 24,
    ButtonSize.medium: 24,
    ButtonSize.small: 20,
  };

  static double get(ButtonSize size) {
    return _data[size]!;
  }
}

class ButtonGapSizeMap {
  static final Map<ButtonSize, double> _data = {
    ButtonSize.large: 24,
    ButtonSize.medium: 16,
    ButtonSize.small: 12,
  };

  static double get(ButtonSize size) {
    return _data[size]!;
  }
}

class ButtonLabelSizeMap {
  static final Map<ButtonSize, TextStyle> _data = {
    ButtonSize.large: LetterPixel.medium.bold,
    ButtonSize.medium: LetterPixel.medium.bold,
    ButtonSize.small: LetterPixel.small.bold,
  };

  static TextStyle get(ButtonSize size) {
    return _data[size]!;
  }
}

class ButtonContentColorMap {
  static final Map<ButtonTheme, Map<ButtonPriority, Color>> _data = {
    ButtonTheme.light: {
      ButtonPriority.primary: ColorPixel.white,
      ButtonPriority.secondary: ColorPixel.black,
      ButtonPriority.tertiary: ColorPixel.dim.shade800,
      ButtonPriority.optional: ColorPixel.dim.shade800,
    },
    ButtonTheme.dark: {
      ButtonPriority.primary: ColorPixel.white,
      ButtonPriority.secondary: ColorPixel.black,
      ButtonPriority.tertiary: ColorPixel.dim.shade800,
      ButtonPriority.optional: ColorPixel.dim.shade800,
    },
  };

  static Color get(ButtonPriority priority, [ButtonTheme theme = ButtonTheme.light]) {
    return _data[theme]![priority]!;
  }
}

class ButtonDisabledContentColorMap {
  static final Map<ButtonTheme, Color> _data = {
    ButtonTheme.light: ColorPixel.dim.shade400,
    ButtonTheme.dark: ColorPixel.dim.shade400,
  };

  static Color get(ButtonTheme theme) {
    return _data[theme]!;
  }
}

class IconButtonContentSizeMap {
  static final Map<ButtonSize, double> _data = {
    ButtonSize.large: 24,
    ButtonSize.medium: 24,
    ButtonSize.small: 20,
  };

  static double get(ButtonSize size) {
    return _data[size]!;
  }
}
