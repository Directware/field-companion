import 'package:field_companion/features/field_service/presentation/providers/reports/selected_date_provider.dart';
import 'package:field_companion/features/field_service/presentation/widgets/report/report_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportBottomSheet extends ConsumerStatefulWidget {
  const ReportBottomSheet({super.key});

  @override
  ConsumerState<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends ConsumerState<ReportBottomSheet> {
  PersistentBottomSheetController? bottomSheet;

  PersistentBottomSheetController _reportStepper(
    BuildContext context,
    WidgetRef ref,
  ) {
    return showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (BuildContext context) {
        return const ReportStepper();
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(selectedDateProvider, (previousDate, date) {
      if (date != null && previousDate == null) {
        bottomSheet = _reportStepper(context, ref);
        bottomSheet?.closed.then((value) {
          ref.read(selectedDateProvider.notifier).clear();
        });
      } else if (date == null && previousDate != null) {
        bottomSheet?.close();
      }
    });

    return Container();
  }
}
