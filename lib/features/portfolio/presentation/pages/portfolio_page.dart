import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/portfolio/presentation/pages/initial_screen.dart';
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
      create: (context) => PortfolioBloc()..add(LoadPortfolioData()),
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          HeroSection(key: _scrollController.homeKey),
                          const Divider(),
                          AboutSection(key: _scrollController.aboutKey),
                          const Divider(),
                          ExperienceSection(
                            key: _scrollController.experienceKey,
                            experiences: state.experiences,
                          ),
                          const Divider(),
                          SkillsSection(
                            key: _scrollController.skillsKey,
                            skills: state.skills,
                          ),
                          const Divider(),
                          ProjectsSection(
                            key: _scrollController.projectsKey,
                            projects: state.projects,
                          ),
                          const Divider(),
                          ContactSection(key: _scrollController.contactKey),
                        ],
                      ),
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
