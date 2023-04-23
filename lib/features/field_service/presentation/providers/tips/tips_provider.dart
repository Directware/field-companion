import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tips_provider.g.dart';

@Riverpod(keepAlive: true)
List<String> tips(TipsRef ref) {
  return List.generate(5, (index) => 'tips.$index'.tr());
}
