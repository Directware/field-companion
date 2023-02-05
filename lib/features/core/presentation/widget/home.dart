import 'dart:ui';

import 'package:field_companion/features/core/presentation/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Widget child;

  const Home({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        bottomNavigationBar: const BottomBar(),
        extendBody: true,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/background-map.jpeg"))),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: child,
              )),
        ),
      ),
    );
  }
}
