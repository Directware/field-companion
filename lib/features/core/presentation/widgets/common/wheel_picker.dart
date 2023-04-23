import 'dart:developer';

import 'package:field_companion/features/core/infrastructure/models/wheel_picker_item.dart';
import 'package:flutter/material.dart';

class WheelPicker extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  WheelPicker({
    super.key,
    required this.onChanged,
    required this.builder,
    this.position,
    this.initialPosition,
    this.itemSize,
    this.height,
    this.width,
    this.selectTextStyle,
    this.unSelectTextStyle,
    this.textAlign,
    this.itemCount,
    this.offAxisFraction = 0.0,
  });

  WheelPicker.number({
    super.key,
    required ValueChanged<int> onChanged,
    int value = 0,
    int? initialValue,
    int? max,
    int min = 0,
    int step = 1,
    this.itemSize,
    this.height,
    this.width,
    this.selectTextStyle,
    this.unSelectTextStyle,
    this.textAlign,
    this.offAxisFraction = 0.0,
  }) {
    position = (value - min) ~/ step;
    initialPosition = ((initialValue ?? 0) - min) ~/ step;
    builder =
        (index, selected) => buildNumberItem(index, selected, step, min, max);
    itemCount = max != null ? (max - min) ~/ step + 1 : null;
    this.onChanged = (index) => onChanged((index + min) * step);
  }

  WheelPicker.item({
    super.key,
    required ValueChanged<dynamic> onChanged,
    required List<WheelPickerItem<dynamic>> items,
    dynamic value,
    dynamic initialValue,
    this.itemSize,
    this.height,
    this.width,
    this.selectTextStyle,
    this.unSelectTextStyle,
    this.textAlign,
    this.offAxisFraction = 0.0,
  }) {
    final initialValueIndex =
        items.indexWhere((item) => item.value == initialValue);
    final valueIndex = items.indexWhere((item) => item.value == value);
    initialPosition = initialValueIndex >= 0 ? initialValueIndex : 0;
    position = valueIndex >= 0 ? valueIndex : 0;
    builder = (index, selected) => buildItem(index, selected, items);
    itemCount = items.length;
    this.onChanged = (index) => onChanged(items[index].value);
  }

  late final int? position;
  late final int? initialPosition;
  late final ValueChanged<int> onChanged;
  late final Widget? Function(int index, bool selected) builder;
  late final int? itemCount;
  final double? height;
  final double? width;
  final double? itemSize;
  final TextStyle? selectTextStyle;
  final TextStyle? unSelectTextStyle;
  final TextAlign? textAlign;
  final double offAxisFraction;

  @override
  _WheelPickerState createState() => _WheelPickerState();

  Widget? buildNumberItem(
    int index,
    // ignore: avoid_positional_boolean_parameters
    bool selected,
    int step,
    int min,
    int? max,
  ) {
    final value = (index + min) * step;
    log("value: $value, index: $index, step: $step, min: $min, max: $max");

    if (value < min || (max != null && value > max)) {
      return null;
    }
    return SizedBox(
      width: double.infinity,
      child: Text(
        value.toString(),
        textAlign: textAlign ?? TextAlign.center,
        textScaleFactor: 1.5,
        style: selected ? selectTextStyle : unSelectTextStyle,
      ),
    );
  }

  Widget? buildItem(
    int index,
    // ignore: avoid_positional_boolean_parameters
    bool selected,
    List<WheelPickerItem<dynamic>> items,
  ) {
    log("index: $index");

    if (index < 0 || index + 1 > items.length) {
      return null;
    }
    return SizedBox(
      width: double.infinity,
      child: Text(
        items[index].text,
        textAlign: textAlign ?? TextAlign.center,
        textScaleFactor: 1.5,
        style: selected ? selectTextStyle : unSelectTextStyle,
      ),
    );
  }
}

class _WheelPickerState extends State<WheelPicker> {
  late FixedExtentScrollController _controller;
  late int _currentPosition;

  @override
  void initState() {
    super.initState();
    log("initialPosition: ${widget.initialPosition}, position: ${widget.position}");
    _currentPosition = widget.initialPosition ?? widget.position ?? 0;
    _controller = FixedExtentScrollController(initialItem: _currentPosition);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onValueChange(int index) {
    setState(() {
      _currentPosition = index;
    });
    widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ListWheelScrollView.useDelegate(
        controller: _controller,
        itemExtent: widget.itemSize ?? 48,
        perspective: 0.01,
        offAxisFraction: widget.offAxisFraction,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: widget.itemCount,
          builder: (context, index) => widget.builder.call(
            index,
            _currentPosition == index,
          ),
        ),
        onSelectedItemChanged: onValueChange,
      ),
    );
  }
}
