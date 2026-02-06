import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../data/portfolio_models.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    // Group skills by category
    final Map<String, List<Skill>> skillsByCategory = {};
    for (var skill in skills) {
      final category = skill.category ?? 'Other';
      if (!skillsByCategory.containsKey(category)) {
        skillsByCategory[category] = [];
      }
      skillsByCategory[category]!.add(skill);
    }

    // Define the order of categories as requested
    final orderedCategories = [
      'Information Technology',
      'State Management',
      'Clean Architecture',
      'Agentic Ai',
      'Digital Marketing',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: SectionTitle(title: AppStrings.skillsTitle)),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: orderedCategories.map((category) {
              final categorySkills = skillsByCategory[category] ?? [];
              if (categorySkills.isEmpty) return const SizedBox.shrink();
              return _buildCategoryCard(context, category, categorySkills);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    List<Skill> skills,
  ) {
    return Container(
      width: 350, // Fixed width for cleaner grid-like look in wrap
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((skill) => _buildSkillChip(context, skill))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, Skill skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        skill.name,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
