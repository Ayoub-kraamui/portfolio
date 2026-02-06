import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../data/portfolio_models.dart';
import '../../../../shared/widgets/custom_card.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SectionTitle(title: AppStrings.experienceTitle),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Text(
                            exp.duration,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${exp.company} • ${exp.location}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        exp.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
