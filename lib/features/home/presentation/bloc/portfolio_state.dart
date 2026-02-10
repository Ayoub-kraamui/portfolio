import 'package:equatable/equatable.dart';
import '../../data/models/project_model.dart';
import '../../data/models/skill_models.dart';
import '../../data/models/experience_models.dart';

enum PortfolioStatus { initial, loading, loaded, error }

class PortfolioState extends Equatable {
  final PortfolioStatus status;
  final List<ExperienceModels> experiences;
  final List<SkillModels> skills;
  final List<ProjectModel> projects;

  const PortfolioState({
    this.status = PortfolioStatus.initial,
    this.experiences = const [],
    this.skills = const [],
    this.projects = const [],
  });

  PortfolioState copyWith({
    PortfolioStatus? status,
    List<ExperienceModels>? experiences,
    List<SkillModels>? skills,
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
