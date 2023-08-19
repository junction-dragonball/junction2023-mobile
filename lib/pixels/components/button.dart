import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yummy_quest/pixels/elements/icon.dart';
import 'package:yummy_quest/pixels/styles/color.dart';
import 'package:yummy_quest/pixels/styles/letter.dart';

part 'button_data.dart';

enum ButtonPriority {
  primary,
  secondary,
  tertiary,
  optional,
}

enum ButtonState {
  enabled,
  loading,
  disabled,
}

enum ButtonSize {
  large,
  medium,
  small,
}

enum ButtonLayout {
  wrapped,
  filled,
}

enum ButtonTheme {
  light,
  dark,
}

class ButtonPixel extends StatefulWidget {
  const ButtonPixel({
    super.key,
    this.priority = ButtonPriority.secondary,
    this.size = ButtonSize.medium,
    this.state = ButtonState.enabled,
    this.layout = ButtonLayout.filled,
    this.theme = ButtonTheme.light,
    this.icon,
    this.align = MainAxisAlignment.center,
    required this.label,
    required this.onPress,
    this.customButtonColor,
    this.customContentColor,
    this.customContent,
  });

  final ButtonPriority priority;
  final ButtonSize size;
  final ButtonState state;
  final ButtonLayout layout;
  final ButtonTheme theme;

  final IconName? icon;
  final String label;
  final Function onPress;
  final MainAxisAlignment align;

  final Color? customButtonColor;
  final Color? customContentColor;
  final Widget? customContent;

  @override
  State<ButtonPixel> createState() => _ButtonPixelState();
}

class _ButtonPixelState extends State<ButtonPixel> {
  bool isLoading = false;
  bool isTapped = false;
  bool isHovered = false;

  void _onTapDown(_) {
    if (mounted) {
      setState(() {
        isTapped = true;
      });
    }
  }

  void _onTapUp(_) {
    if (mounted) {
      setState(() {
        isTapped = false;
      });
    }
  }

  void _onTapCancel() {
    if (mounted) {
      setState(() {
        isTapped = false;
      });
    }
  }

  Future<void> _onTap() async {
    final start = DateTime.now();

    if (widget.state != ButtonState.enabled) {
      return;
    }

    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    HapticFeedback.lightImpact();
    await widget.onPress();

    final delay = 750 - DateTime.now().difference(start).inMilliseconds;

    Future.delayed(Duration(milliseconds: delay < 0 ? 0 : delay), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  Widget _container({required List<Widget> children}) {
    final double height = ButtonSizeMap.get(widget.size);
    final Color color = widget.state == ButtonState.disabled
        ? ButtonDisabledColorMap.get(widget.theme)
        : widget.customButtonColor ?? ButtonColorMap.get(widget.priority);

    final MainAxisSize mainAxisSize =
        widget.layout == ButtonLayout.filled ? MainAxisSize.max : MainAxisSize.min;

    return Container(
      width: widget.layout == ButtonLayout.filled ? double.infinity : null,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: widget.priority != ButtonPriority.tertiary ? color : null,
        border: widget.priority == ButtonPriority.tertiary ? Border.all(color: color) : null,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      constraints: BoxConstraints(minWidth: height, maxHeight: height),
      child: Row(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ...children,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    final Color color = widget.state == ButtonState.disabled
        ? ButtonDisabledContentColorMap.get(widget.theme)
        : widget.customContentColor ?? ButtonContentColorMap.get(widget.priority);

    final MainAxisSize mainAxisSize =
        widget.layout == ButtonLayout.filled ? MainAxisSize.max : MainAxisSize.min;

    final double gap = ButtonGapSizeMap.get(widget.size);

    List<Widget> contents = [
      SizedBox(width: gap),
    ];

    if (widget.icon != null) {
      contents.addAll([
        IconPixel(
          name: widget.icon!,
          size: ButtonIconSizeMap.get(widget.size),
          color: color,
        ),
        const SizedBox(width: 8),
      ]);
    }

    contents.addAll([
      Text(
        widget.label,
        style: ButtonLabelSizeMap.get(widget.size).withColor(color),
        overflow: TextOverflow.ellipsis,
      ),
      SizedBox(width: gap),
    ]);

    return AnimatedOpacity(
      opacity: isLoading && widget.priority != ButtonPriority.optional ? 0.65 : 1.0,
      duration: const Duration(milliseconds: 150),
      child: widget.customContent ??
          Row(
            mainAxisSize: mainAxisSize,
            mainAxisAlignment: widget.align,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: contents,
          ),
    );
  }

  /* Widget _loading() {
    if (widget.priority == ButtonPriority.optional) {
      return const SizedBox.shrink();
    }

    final Color color = widget.customContentColor ?? ButtonContentColorMap.get(widget.priority);

    return AnimatedOpacity(
      opacity: isLoading ? 1.0 : 0.0,
      duration: 150.ms,
      child: Container(
        alignment: Alignment.center,
        color: ColorPixel.white.withOpacity(0.30),
        child: LoadingIconPixel(
          size: IconButtonContentSizeMap.get(widget.size),
          color: color,
        ),
      ),
    );
  } */

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.state == ButtonState.disabled || isLoading,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: _onTap,
        child: AnimatedScale(
          scale: isTapped ? 0.85 : 1.0,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutBack,
          child: _container(
            children: [
              _content(),
              // _loading(),
            ],
          ),
        ),
      ),
    );
  }
}

class IconButtonPixel extends StatefulWidget {
  const IconButtonPixel({
    super.key,
    this.priority = ButtonPriority.secondary,
    this.size = ButtonSize.medium,
    this.state = ButtonState.enabled,
    this.theme = ButtonTheme.light,
    required this.icon,
    required this.onPress,
    this.customButtonColor,
    this.customContentColor,
    this.customContent,
  });

  final ButtonPriority priority;
  final ButtonSize size;
  final ButtonState state;
  final ButtonTheme theme;

  final IconName icon;
  final Function onPress;

  final Color? customButtonColor;
  final Color? customContentColor;
  final Widget? customContent;

  @override
  State<IconButtonPixel> createState() => _IconButtonPixelState();
}

class _IconButtonPixelState extends State<IconButtonPixel> {
  bool isLoading = false;
  bool isTapped = false;
  bool isHovered = false;

  void _onTapDown(_) {
    if (mounted) {
      setState(() {
        isTapped = true;
      });
    }
  }

  void _onTapUp(_) {
    if (mounted) {
      setState(() {
        isTapped = false;
      });
    }
  }

  void _onTapCancel() {
    if (mounted) {
      setState(() {
        isTapped = false;
      });
    }
  }

  Future<void> _onTap() async {
    final start = DateTime.now();

    if (widget.state != ButtonState.enabled) {
      return;
    }

    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    HapticFeedback.lightImpact();
    await widget.onPress();

    final delay = 750 - DateTime.now().difference(start).inMilliseconds;

    Future.delayed(Duration(milliseconds: delay < 0 ? 0 : delay), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  Widget _container({required List<Widget> children}) {
    final double size = ButtonSizeMap.get(widget.size);
    final Color color = widget.state == ButtonState.disabled
        ? ButtonDisabledColorMap.get(widget.theme)
        : widget.customButtonColor ?? ButtonColorMap.get(widget.priority);

    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color:
            widget.priority != ButtonPriority.tertiary && widget.priority != ButtonPriority.optional
                ? color
                : null,
        border: widget.priority == ButtonPriority.tertiary ? Border.all(color: color) : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ...children,
        ],
      ),
    );
  }

  Widget _content() {
    final Color color = widget.state == ButtonState.disabled
        ? ButtonDisabledContentColorMap.get(widget.theme)
        : widget.customContentColor ?? ButtonContentColorMap.get(widget.priority);

    return AnimatedOpacity(
      opacity: isLoading && widget.priority != ButtonPriority.optional ? 0.65 : 1.0,
      duration: const Duration(milliseconds: 150),
      child: widget.customContent ??
          IconPixel(
            name: widget.icon,
            size: IconButtonContentSizeMap.get(widget.size),
            color: color,
          ),
    );
  }

  /* Widget _loading() {
    if (widget.priority == ButtonPriority.optional) {
      return const SizedBox.shrink();
    }

    final Color color = widget.customContentColor ?? ButtonContentColorMap.get(widget.priority);

    return AnimatedOpacity(
      opacity: isLoading ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 150),
      child: Container(
        color: ColorPixel.white.withOpacity(0.30),
        child: Center(
          child: LoadingIconPixel(
            size: IconButtonContentSizeMap.get(widget.size),
            color: color,
          ),
        ),
      ),
    );
  } */

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.state == ButtonState.disabled || isLoading,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: _onTap,
        child: AnimatedScale(
          scale: isTapped ? 0.85 : 1.0,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutBack,
          child: _container(
            children: [
              _content(),
              // _loading(),
            ],
          ),
        ),
      ),
    );
  }
}
