import 'package:flutter/material.dart';

class StatDivider extends StatelessWidget {
  const StatDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey.withValues(alpha: 0.3),
      margin: const EdgeInsets.symmetric(horizontal: 24),
    );
  }
}
