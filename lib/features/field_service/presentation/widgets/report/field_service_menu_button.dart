import 'dart:ui';

import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/providers/active_route_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_date_provider.dart';
import 'package:field_companion/features/field_service/presentation/widgets/report/field_service_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldServiceMenuButton extends ConsumerStatefulWidget {
  const FieldServiceMenuButton({
    super.key,
    required this.items,
    required this.onMenuItemTap,
  });

  final List<String> items;
  final ValueChanged<String> onMenuItemTap;

  @override
  ConsumerState<FieldServiceMenuButton> createState() =>
      _FieldServiceMenuButtonState();
}

class _FieldServiceMenuButtonState extends ConsumerState<FieldServiceMenuButton>
    with RouteAware, SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  OverlayEntry? overlay;
  bool isOpen = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: Curves.easeInOutCubic,
        parent: animationController,
      ),
    );

    super.initState();
  }

  void _destroyOverlay({bool instant = false}) {
    if (instant) {
      overlay?.remove();
      overlay = null;
      setState(() {
        isOpen = false;
      });
      return;
    }

    animationController.reverse().then((value) {
      overlay?.remove();
      overlay = null;
      setState(() {
        isOpen = false;
      });
    });
  }

  @override
  void didPush() {
    overlay?.remove();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _createOverlay(BuildContext context) {
    ref.read(selectedDateProvider.notifier).clear();
    overlay = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              right: 0,
              child: FadeTransition(
                opacity: animation,
                child: GestureDetector(
                  onTap: _destroyOverlay,
                  child: const ColoredBox(color: ColorPalette.backdrop),
                ),
              ),
            ),
            Positioned(
              top: 32,
              right: 16,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Material(
                    color: ColorPalette.grey2Opacity24,
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: _destroyOverlay,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          FeatherIcons.x,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              right: 16,
              child: FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  alignment: Alignment.topRight,
                  child: FieldServiceMenu(
                    items: widget.items,
                    onMenuItemTap: (key) {
                      _destroyOverlay();
                      widget.onMenuItemTap(key);
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    final overlayState = Overlay.of(context);

    animationController.addListener(() {
      overlayState.setState(() {});
    });
    animationController.forward();
    overlayState.insert(overlay!);
    setState(() {
      isOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      activeRouteProvider,
      (_, __) => _destroyOverlay(instant: true),
    );

    return Opacity(
      opacity: isOpen ? 0 : 1,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Material(
            color: ColorPalette.grey2Opacity24,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () => _createOverlay(context),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  FeatherIcons.moreHorizontal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
