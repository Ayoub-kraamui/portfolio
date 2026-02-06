import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SectionTitle(title: AppStrings.aboutTitle),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              AppStrings.aboutDescription,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.8),
            ),
          ),
        ],
      ),
    );
  }
}
