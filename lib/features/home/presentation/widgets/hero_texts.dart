import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class HeroTexts extends StatelessWidget {
  const HeroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
            children: [
              const TextSpan(text: '${AppStrings.heroHeadlineStart}\n'),
              TextSpan(
                text: AppStrings.heroHeadlineMiddle,
                style: TextStyle(
                  color: Colors.transparent,
                  shadows: [
                    Shadow(
                      offset: const Offset(0, -4),
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.secondary,
                  decorationThickness: 3,
                ),
              ),
              const TextSpan(text: '\n ${AppStrings.heroHeadlineEnd}'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          AppStrings.heroSubTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(
              context,
            ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
