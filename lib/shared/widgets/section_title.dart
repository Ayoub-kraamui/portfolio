import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color? color;

  const SectionTitle({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
