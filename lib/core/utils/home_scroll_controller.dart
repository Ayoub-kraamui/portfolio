import 'package:flutter/material.dart';

class HomeScrollController {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(int index) {
    final key = switch (index) {
      0 => homeKey,
      1 => aboutKey,
      2 => experienceKey,
      3 => skillsKey,
      4 => projectsKey,
      5 => contactKey,
      _ => null,
    };

    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
