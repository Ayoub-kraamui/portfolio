import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../data/models/skill_models.dart';

class SkillsSection extends StatelessWidget {
  final List<SkillModels> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    // تجميع المهارات حسب الفئة
    final Map<String, List<SkillModels>> skillsByCategory = {};
    for (var skill in skills) {
      final category = skill.category ?? 'Other';
      if (!skillsByCategory.containsKey(category)) {
        skillsByCategory[category] = [];
      }
      skillsByCategory[category]!.add(skill);
    }

    // ترتيب الفئات حسب الطلب
    final orderedCategories = [
      'Information Technology',
      'State Management',
      'Clean Architecture',
      'Agentic Ai',
      'Digital Marketing',
      'Project Management',
    ];

    // تصفية الفئات الفارغة
    final activeCategories = orderedCategories
        .where(
          (c) =>
              skillsByCategory.containsKey(c) &&
              skillsByCategory[c]!.isNotEmpty,
        )
        .toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: SectionTitle(title: AppStrings.skillsTitle)),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              int columns = 1;
              if (width > 1100) {
                columns = 3;
              } else if (width > 700) {
                columns = 2;
              }

              // توزيع الفئات على الأعمدة
              List<List<String>> columnData = List.generate(columns, (_) => []);
              for (int i = 0; i < activeCategories.length; i++) {
                columnData[i % columns].add(activeCategories[i]);
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(columns, (colIndex) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: colIndex != columns - 1 ? 20.0 : 0.0,
                      ),
                      child: Column(
                        children: columnData[colIndex].map((category) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: _buildCategoryCard(
                              context,
                              category,
                              skillsByCategory[category]!,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    List<SkillModels> skills,
  ) {
    return Container(
      width: double.infinity,
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
            alignment: WrapAlignment.center,
            children: skills
                .map((skill) => _buildSkillChip(context, skill))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, SkillModels skill) {
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
