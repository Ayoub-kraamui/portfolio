import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/portfolio_local_data_source.dart';
import '../../data/repositories/portfolio_repository_impl.dart';
import '../../../../core/services/url_launcher_service.dart';
import '../../../../core/utils/home_scroll_controller.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../bloc/portfolio_state.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';
import 'initial_screen.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/section_title.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollController = HomeScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PortfolioBloc(
        repository: PortfolioRepositoryImpl(
          localDataSource: PortfolioLocalDataSourceImpl(),
        ),
        urlLauncherService: UrlLauncherService(),
      )..add(LoadPortfolioData()),
      child: Scaffold(
        body: BlocBuilder<PortfolioBloc, PortfolioState>(
          builder: (context, state) {
            if (state.status == PortfolioStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == PortfolioStatus.loaded) {
              return Column(
                children: [
                  InitialScreen(scrollController: _scrollController),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: HeroSection(key: _scrollController.homeKey),
                        ),
                        const SliverToBoxAdapter(child: Divider()),
                        SliverToBoxAdapter(
                          child: AboutSection(key: _scrollController.aboutKey),
                        ),
                        const SliverToBoxAdapter(child: Divider()),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: SectionTitle(
                              key: _scrollController.experienceKey,
                              title: AppStrings.experienceTitle,
                            ),
                          ),
                        ),
                        ExperienceSliverList(experiences: state.experiences),
                        const SliverToBoxAdapter(child: Divider()),
                        SliverToBoxAdapter(
                          child: SkillsSection(
                            key: _scrollController.skillsKey,
                            skills: state.skills,
                          ),
                        ),
                        const SliverToBoxAdapter(child: Divider()),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: SectionTitle(
                              key: _scrollController.projectsKey,
                              title: AppStrings.projectsTitle,
                            ),
                          ),
                        ),
                        ProjectsSliverGrid(projects: state.projects),
                        const SliverToBoxAdapter(child: Divider()),
                        SliverToBoxAdapter(
                          child: ContactSection(
                            key: _scrollController.contactKey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
