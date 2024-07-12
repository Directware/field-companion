import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:field_companion/features/territories/presentation/views/return_territory_view.dart';
import 'package:field_companion/features/territories/presentation/views/territory_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlurredBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/background-map.jpeg'),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: const Center(),
      ),
    );
  }
}

class TerritoriesSheet extends ConsumerStatefulWidget {
  @override
  _TerritoriesSheetState createState() => _TerritoriesSheetState();
}

class _TerritoriesSheetState extends ConsumerState<TerritoriesSheet> {
  List<Territory> territories = [];
  final sheetController = DraggableScrollableController();
  bool showTerritoryList = true;
  bool isShowingReturnTerritoryView = false;
  Territory? selectedTerritory;

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
    territories = ref.watch(territoriesProvider);
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
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Stack(
            children: [
              BlurredBackgroundImage(),
              CustomScrollView(
                controller: scrollController,
                slivers: [
                  _buildTopBar(context),
                  _buildAppBar(),
                  _buildTerritoryList(context),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          height: 4,
          width: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      title: _buildAnimatedSwitcher(
        (showTerritoryList && selectedTerritory == null)
            ? Text(
                'territories.title'.tr(),
                style: const TextStyle(color: Colors.white),
                key: const ValueKey<String>('territories.title'),
              )
            : Text(
                selectedTerritory!.name,
                style: const TextStyle(color: Colors.white),
                key: ValueKey<String>(selectedTerritory!.name),
              ),
      ),
      backgroundColor: Colors.transparent,
      primary: false,
      pinned: true,
      centerTitle: true,
      leading: _buildAnimatedSwitcher(
        !showTerritoryList
            ? IconButton(
                key: const ValueKey<String>('backButton'),
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    if (isShowingReturnTerritoryView) {
                      isShowingReturnTerritoryView = false;
                    } else {
                      showTerritoryList = true;
                      selectedTerritory = null;
                    }
                  });
                },
              )
            : const SizedBox(key: ValueKey<String>('emptySpace')),
      ),
    );
  }

  Widget _buildAnimatedSwitcher(Widget child) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: child,
    );
  }

  Widget _buildTerritoryList(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        child: Stack(
          children: [
            Visibility(
              visible: !showTerritoryList && !isShowingReturnTerritoryView,
              child: selectedTerritory != null
                  ? TerritoryDetailView(
                      territory: selectedTerritory!,
                      toggleReturnTerritoryView: (p0) => toggleReturnTerritoryView(p0),
                    )
                  : const Text(
                      "No territory selected",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            Visibility(
              visible: isShowingReturnTerritoryView,
              child: selectedTerritory != null
                  ? ReturnTerritoryView(
                      territory: selectedTerritory!,
                      backToTerritoryList: backToTerritoryList,
                      toggleReturnTerritoryView: (p0) => toggleReturnTerritoryView(p0),
                    )
                  : const Text("No territory selected"),
            ),
            Visibility(
              visible: showTerritoryList,
              child: _buildTerritoryListView(context),
            ),
          ],
        ),
      ),
    );
  }

  void backToTerritoryList() {
    setState(() {
      isShowingReturnTerritoryView = false;
      showTerritoryList = true;
      selectedTerritory = null;
    });
  }

  void toggleReturnTerritoryView(bool show) {
    setState(() {
      isShowingReturnTerritoryView = show;
    });
  }

  Widget _buildTerritoryListView(BuildContext context) {
    return SizedBox(
      key: const ValueKey<int>(1),
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final territory = territories[index];
                return _buildTerritoryListItem(context, territory);
              },
              childCount: territories.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTerritoryListItem(BuildContext context, Territory territory) {
    return InkWell(
      child: ListTile(
        title: Text(
          territory.name,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          territory.key,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
      onTap: () {
        ref.read(selectedTerritoryProvider.notifier).set(territory);
        if (sheetController.size < 0.5) {
          sheetController.animateTo(0.5, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        }
        setState(() {
          showTerritoryList = false;
          selectedTerritory = territory;
        });
      },
    );
  }
}
