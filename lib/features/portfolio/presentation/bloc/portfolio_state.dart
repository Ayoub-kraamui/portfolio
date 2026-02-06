import 'package:equatable/equatable.dart';
import '../../data/portfolio_models.dart';

enum PortfolioStatus { initial, loading, loaded, error }

class PortfolioState extends Equatable {
  final PortfolioStatus status;
  final List<Experience> experiences;
  final List<Skill> skills;
  final List<ProjectModel> projects;

  const PortfolioState({
    this.status = PortfolioStatus.initial,
    this.experiences = const [],
    this.skills = const [],
    this.projects = const [],
  });

  PortfolioState copyWith({
    PortfolioStatus? status,
    List<Experience>? experiences,
    List<Skill>? skills,
    List<ProjectModel>? projects,
  }) {
    return PortfolioState(
      status: status ?? this.status,
      experiences: experiences ?? this.experiences,
      skills: skills ?? this.skills,
      projects: projects ?? this.projects,
    );
  }

  @override
  List<Object> get props => [status, experiences, skills, projects];
}
