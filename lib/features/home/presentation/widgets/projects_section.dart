import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/home/presentation/bloc/portfolio_bloc.dart';
import 'package:portfolio/features/home/presentation/bloc/portfolio_event.dart';
import '../../data/models/project_model.dart';
import '../../../../shared/widgets/custom_card.dart';

class ProjectsSliverGrid extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectsSliverGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    // حساب عدد الأعمدة في الشبكة حسب حجم الشاشة
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = 1;
    if (width > 600) crossAxisCount = 2;
    if (width > 900) crossAxisCount = 3;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.8, // تعديل حسب المحتوى
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return _ProjectCard(project: projects[index]);
        }, childCount: projects.length),
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
        context.read<PortfolioBloc>().add(OpenLinkEvent(project.link!));
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
                  image: ResizeImage(AssetImage(project.imagePath), width: 800),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // تفاصيل المشروع
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
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(height: 1.5),
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
