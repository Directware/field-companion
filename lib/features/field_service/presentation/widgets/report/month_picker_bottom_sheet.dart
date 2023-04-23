import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/infrastructure/models/debouncer.dart';
import 'package:field_companion/features/core/presentation/widgets/common/month_picker.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_month_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthPickerBottomSheet extends ConsumerWidget {
  const MonthPickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final debouncer = Debouncer(delay: const Duration(milliseconds: 150));

    return Wrap(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: ColorPalette.grey2Opacity08,
              ),
              child: Column(
                children: [
                  Container(
                    height: 1,
                    color: ColorPalette.whiteOpacity10,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: MonthPicker(
                          title: 'service.month'.tr(),
                          value: selectedMonth,
                          onChanged: (value) => debouncer.run(
                            () => ref
                                .read(selectedMonthProvider.notifier)
                                .set(value),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
