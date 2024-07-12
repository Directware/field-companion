import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class ReturnTerritoryView extends ConsumerStatefulWidget {
  const ReturnTerritoryView({
    super.key,
    required this.territory,
    required this.backToTerritoryList,
    required this.toggleReturnTerritoryView,
  });

  final Territory territory;
  final Function() backToTerritoryList;
  final Function(bool) toggleReturnTerritoryView;

  @override
  ConsumerState<ReturnTerritoryView> createState() => _ReturnTerritoryViewState();
}

class _ReturnTerritoryViewState extends ConsumerState<ReturnTerritoryView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: UiSpacing.spacingS),
        getInstructionRow(
          1,
          'Make sure this is really the right territory and you have completed it.',
        ),
        getInstructionRow(
          2,
          'Send your territory servant the territory with the send button with the first button below.',
        ),
        getInstructionRow(
          3,
          'After you successfully send the territory back to your territory servant, delete it from your app, by marking it as done with the button below.',
        ),
        const SizedBox(height: UiSpacing.spacingM),
        Padding(
          padding: const EdgeInsets.all(UiSpacing.spacingS),
          child: ElevatedButton(
            onPressed: () async {
              final Directory directory = await getTemporaryDirectory();
              final String filePath = '${directory.path}/${widget.territory.name}.territory';
              final File file = File(filePath);

              await file.writeAsString(widget.territory.toJson().toString());

              final Email email = Email(
                subject: 'territories.returnTerritory'.tr(),
                attachmentPaths: ['path/to/your/attachment'],
              );

              try {
                await FlutterEmailSender.send(email);
              } catch (e) {
                final BuildContext dialogContext = context; // Store the context locally
                if (dialogContext.mounted) {
                  showCupertinoDialog(
                    context: dialogContext,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: const Text('Error'),
                        content: Text('Failed to send email: $e'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.blue,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'territories.sendToServant'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.toggleReturnTerritoryView(false);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.transparent,
                side: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              child: Text(
                'common.cancel'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('Are you sure you want to delete this territory form your app?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            ref.read(territoriesProvider.notifier).delete(widget.territory);
                            widget.backToTerritoryList();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Confirm'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.transparent,
                side: const BorderSide(
                  color: ColorPalette.red,
                ),
              ),
              child: const Text(
                'Mark Territory as Done',
                style: TextStyle(
                  color: ColorPalette.red,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getInstructionRow(int index, String instruction) {
    return Padding(
      padding: const EdgeInsets.all(UiSpacing.spacingS),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorPalette.blue,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                index.toString(),
                style: const TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: UiSpacing.spacingS),
          Expanded(
            child: Text(
              instruction,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Heebo',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
