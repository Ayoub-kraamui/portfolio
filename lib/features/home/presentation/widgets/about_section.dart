import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine screen width to decide layout mode
    final width = MediaQuery.of(context).size.width;
    final isWeb = width > 900;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          const SectionTitle(title: AppStrings.aboutTitle),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isWeb ? 1100 : 800),
            child: isWeb
                ? _buildWebLayout(context)
                : _buildMobileLayout(context),
          ),
        ],
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    final descriptions = AppStrings.aboutDescription;
    final mid = (descriptions.length / 2).ceil();
    final leftColumn = descriptions.sublist(0, mid);
    final rightColumn = descriptions.sublist(mid);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: leftColumn
                .map((desc) => _buildAboutItem(context, desc))
                .toList(),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: Column(
            children: rightColumn
                .map((desc) => _buildAboutItem(context, desc))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: AppStrings.aboutDescription
          .map((desc) => _buildAboutItem(context, desc))
          .toList(),
    );
  }

  Widget _buildAboutItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Icon(
              Icons.circle,
              color: Theme.of(context).colorScheme.primary,
              size: 8,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.8, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
