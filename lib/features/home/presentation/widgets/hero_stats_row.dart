import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import 'stat_item.dart';
import 'stat_divider.dart';

class HeroStatsRow extends StatelessWidget {
  const HeroStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const StatItem(value: '1+', label: AppStrings.statsExp),
        const StatDivider(),
        const StatItem(value: '5+', label: AppStrings.statsProjects),
        const StatDivider(),
        const StatItem(value: '5+', label: AppStrings.statsClients),
      ],
    );
  }
}
