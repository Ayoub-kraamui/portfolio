import '../../data/models/project_model.dart';
import '../../data/models/skill_models.dart';
import '../../data/models/experience_models.dart';

abstract class PortfolioRepository {
  Future<List<ExperienceModels>> getExperiences();
  Future<List<SkillModels>> getSkills();
  Future<List<ProjectModel>> getProjects();
}
