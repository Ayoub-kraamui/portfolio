import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/portfolio_models.dart';
import '../../../../core/constants/constants.dart' as constants;

import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(const PortfolioState()) {
    on<LoadPortfolioData>(_onLoadData);
  }

  Future<void> _onLoadData(
    LoadPortfolioData event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(state.copyWith(status: PortfolioStatus.loading));

    // Simulate slight delay for "loading" effect if desired, or just load immediately
    await Future.delayed(const Duration(milliseconds: 500));

    final experiences = [
      const Experience(
        company: 'evorie-ksa.com',
        role: 'Digital Marketing',
        duration: '2025 - Present',
        location: 'Riyadh, Saudi',
        description:
            'Store and promotion management, customer service, and enhancing customer experience. Managing digital ad campaigns (Google, Meta, TikTok). SEO improvements.',
      ),
      const Experience(
        company: 'Freelancer',
        role: 'Flutter Developer',
        duration: '2024 - Present',
        location: 'Ibb, YEM',
        description:
            'Member of a team of programmers and designers. Application development with clean architecture. Developing open source software as per customer request.',
      ),
    ];

    final skills = [
      // Information Technology
      const Skill(name: 'Git', category: 'Information Technology'),
      const Skill(name: 'GitHub', category: 'Information Technology'),
      const Skill(name: 'VS Code', category: 'Information Technology'),
      const Skill(name: 'Postman', category: 'Information Technology'),
      const Skill(name: 'Figma', category: 'Information Technology'),
      const Skill(name: 'Adobe XD', category: 'Information Technology'),

      // State Management
      const Skill(name: 'Bloc', category: 'State Management'),
      const Skill(name: 'Cubit', category: 'State Management'),
      const Skill(name: 'Provider', category: 'State Management'),
      const Skill(name: 'GetX', category: 'State Management'),
      const Skill(name: 'Riverpod', category: 'State Management'),

      // Clean Architecture
      const Skill(name: 'Clean Architecture', category: 'Clean Architecture'),
      const Skill(name: 'MVVM', category: 'Clean Architecture'),
      const Skill(name: 'MVC', category: 'Clean Architecture'),
      const Skill(name: 'SOLID Principles', category: 'Clean Architecture'),
      const Skill(name: 'Dependency Injection', category: 'Clean Architecture'),

      // Agentic AI
      const Skill(name: 'Agentic AI', category: 'Agentic Ai'),
      const Skill(name: 'LLM Integration', category: 'Agentic Ai'),
      const Skill(name: 'Prompt Engineering', category: 'Agentic Ai'),
      const Skill(name: 'RAG', category: 'Agentic Ai'),

      // Digital Marketing
      const Skill(name: 'SEO', category: 'Digital Marketing'),
      const Skill(name: 'Google Ads', category: 'Digital Marketing'),
      const Skill(name: 'Meta Ads', category: 'Digital Marketing'),
      const Skill(name: 'TikTok Ads', category: 'Digital Marketing'),
      const Skill(name: 'Analytics', category: 'Digital Marketing'),
    ];

    // Use projects from constants
    final projects = constants.projects;

    emit(
      state.copyWith(
        status: PortfolioStatus.loaded,
        experiences: experiences,
        skills: skills,
        projects: projects,
      ),
    );
  }
}
