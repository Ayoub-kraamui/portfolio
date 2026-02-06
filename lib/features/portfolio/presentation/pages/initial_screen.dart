import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/home_scroll_controller.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/nav_bar_mobile.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/nav_bar_web.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key, required this.scrollController});
  final HomeScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return NavBarMobile(onNavItemTap: scrollController.scrollTo);
        } else {
          return NavBarWeb(onNavItemTap: scrollController.scrollTo);
        }
      },
    );
  }
}
