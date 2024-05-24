import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:field_companion/features/territories/presentation/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TerritoryMap extends ConsumerStatefulWidget {
  const TerritoryMap({super.key});

  @override
  _TerritoryMapState createState() => _TerritoryMapState();
}

class _TerritoryMapState extends ConsumerState<TerritoryMap> {
  List<Territory> territories = [];

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
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        context.go(AppLocations.territories.href);
      },
      child: Scaffold(
        body: Stack(
          children: [
            // floating button
            const MapWidget(),
            Positioned(
              top: 15,
              left: 15,
              child: SafeArea(
                child: InkWell(
                  onTap: () {
                    context.go(AppLocations.territories.href);
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorPalette.dark,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        color: Colors.white,
                        size: 32,
                        FeatherIcons.arrowLeft,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.15,
              minChildSize: 0.15,
              maxChildSize: 0.8,
              snap: true,
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
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
                              ),
                              onTap: () {
                                print(
                                    'Should focus on territory: ${territory.name}');
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
