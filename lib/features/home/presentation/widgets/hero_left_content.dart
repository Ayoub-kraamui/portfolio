import 'package:flutter/material.dart';
import 'welcome_badge.dart';
import 'hero_texts.dart';
import 'hero_action_buttons.dart';
import 'hero_stats_row.dart';
import 'hero_social_links.dart';

class HeroLeftContent extends StatelessWidget {
  final double width;

  const HeroLeftContent({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: width > 500
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        const WelcomeBadge(),
        const SizedBox(height: 24),
        const HeroTexts(),
        const SizedBox(height: 32),
        HeroActionButtons(width: width),
        const SizedBox(height: 48),
        const HeroStatsRow(),
        const SizedBox(height: 32),
        const HeroSocialLinks(),
      ],
    );
  }
}
