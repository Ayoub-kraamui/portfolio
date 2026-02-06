import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../data/portfolio_models.dart';
import '../../../../shared/widgets/custom_card.dart';

class ProjectsSection extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectsSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    // Responsive grid count calculation
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = 1;
    if (width > 600) crossAxisCount = 2;
    if (width > 900) crossAxisCount = 3;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SectionTitle(title: AppStrings.projectsTitle),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8, // Adjust based on content
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return _ProjectCard(project: projects[index]);
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.zero,
      onTap: () {
        // TODO: Open Project Details or Link
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                image: DecorationImage(
                  image: AssetImage(project.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Project Details
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
