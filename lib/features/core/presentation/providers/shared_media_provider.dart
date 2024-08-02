import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_handler/share_handler.dart';

part 'shared_media_provider.g.dart';

@Riverpod(keepAlive: true)
class IncomingSharedMedia extends _$IncomingSharedMedia {
  Future<void> initPlatformState() async {
    final handler = ShareHandlerPlatform.instance;
    final media = await handler.getInitialSharedMedia();

    ref
        .read(territoriesProvider.notifier)
        .addFromFile(media?.attachments?.first?.path);

    handler.sharedMediaStream.listen((SharedMedia media) {
      ref
          .read(territoriesProvider.notifier)
          .addFromFile(media.attachments?.first?.path);
    });
  }

  @override
  void build() {
    initPlatformState();
  }
}
