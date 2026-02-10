import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/experience_models.dart';
import '../../../../shared/widgets/custom_card.dart';

class ExperienceSliverList extends StatelessWidget {
  final List<ExperienceModels> experiences;

  const ExperienceSliverList({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList.builder(
        itemCount: experiences.length,
        itemBuilder: (context, index) {
          final exp = experiences[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        exp.role,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        exp.duration,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                              ? AppColors.textSecondaryLight
                              : AppColors.textSecondaryDark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${exp.company} • ${exp.location}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.textSecondaryLight
                          : AppColors.textSecondaryDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    exp.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.textPrimaryLight
                          : AppColors.textPrimaryDark,
                      height: 1.5,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
