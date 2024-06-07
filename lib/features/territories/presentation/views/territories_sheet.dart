import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:field_companion/features/territories/presentation/views/territory_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TerritoriesSheet extends ConsumerStatefulWidget {
  @override
  _TerritoriesSheetState createState() => _TerritoriesSheetState();
}

class _TerritoriesSheetState extends ConsumerState<TerritoriesSheet> {
  List<Territory> territories = [];
  final sheetController = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    getTerritories();
  }

  void getTerritories() {
    setState(() {
      final territories = ref.read(territoriesProvider);
      this.territories = territories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.1,
      maxChildSize: 0.85,
      snap: true,
      snapSizes: const [0.1, 0.2, 0.5, 0.85],
      controller: sheetController,
      builder: (BuildContext context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 4,
                    width: 40,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              SliverAppBar(
                title: Text('territories.title'.tr()),
                primary: false,
                pinned: true,
                centerTitle: false,
              ),
              // create a list of territories
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: territories.length,
                  (BuildContext context, int index) {
                    final territory = territories[index];
                    return InkWell(
                      child: ListTile(
                        title: Text(territory.name),
                        subtitle: Text(territory.key),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      onTap: () {
                        ref
                            .read(selectedTerritoryProvider.notifier)
                            .set(territory);
                        sheetController.animateTo(
                          0.25,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return TerritoryDetailView(
                                territory: territory,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
