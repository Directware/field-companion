import 'package:field_companion/features/field_service/presentation/providers/reports/selected_month_reports_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_videos_provider.g.dart';

@riverpod
int totalVideos(TotalVideosRef ref) {
  return ref.watch(selectedMonthReportsProvider).fold(
        0,
        (previousValue, report) => previousValue + report.videos,
      );
}