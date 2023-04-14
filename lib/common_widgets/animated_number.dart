import 'package:flutter/material.dart';

class AnimatedNumber extends ImplicitlyAnimatedWidget {
  const AnimatedNumber({
    super.key,
    required this.number,
    super.duration = const Duration(milliseconds: 600),
    super.curve = Curves.fastOutSlowIn,
    required this.builder,
  });

  final num number;
  final Widget Function(num) builder;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedCountState();
  }
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedNumber> {
  IntTween? _intCount = IntTween(begin: 0, end: 1);
  Tween<double>? _doubleCount = Tween<double>();

  @override
  Widget build(BuildContext context) {
    return widget.number is int
        ? widget.builder(_intCount?.evaluate(animation) ?? 0)
        : widget.builder(_doubleCount?.evaluate(animation) ?? 0);
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    if (widget.number is int) {
      _intCount = visitor(
        _intCount,
        widget.number,
        (dynamic value) => IntTween(begin: value as int),
      ) as IntTween?;
    } else {
      _doubleCount = visitor(
        _doubleCount,
        widget.number,
        (dynamic value) => Tween<double>(begin: value as double),
      ) as Tween<double>?;
    }
  }
}
