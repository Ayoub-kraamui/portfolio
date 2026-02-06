import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/constants/image_app.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image with Glow
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                ImageApp.profile,
              ), // Needs a real image
            ),
          ),
          const SizedBox(height: 24),

          // Greeting
          Text(
            AppStrings.heroGreeting,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 8),

          // Name
          Text(
            AppStrings.heroName,
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Title
          Text(
            AppStrings.heroTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: AppColors.primary),
          ),
          Text(
            AppStrings.heroSubTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(
                context,
              ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 24),

          // Social Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () => launchUrl('https://${AppStrings.linkedin}'),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () => launchUrl('https://${AppStrings.github}'),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.envelope),
                onPressed: () => launchUrl('mailto:${AppStrings.email}'),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Download CV Button
          CustomButton(
            label: AppStrings.downloadCv,
            icon: Icons.download,
            onPressed: () {
              openCv();
            },
          ),
        ],
      ),
    );
  }
}
