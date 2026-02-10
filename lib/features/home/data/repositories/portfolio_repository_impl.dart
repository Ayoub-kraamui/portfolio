import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_data_source.dart';
import '../../data/models/project_model.dart';
import '../../data/models/skill_models.dart';
import '../../data/models/experience_models.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource localDataSource;

  PortfolioRepositoryImpl({required this.localDataSource});

  @override
  Future<List<ExperienceModels>> getExperiences() async {
    return await localDataSource.getExperiences();
  }

  @override
  Future<List<SkillModels>> getSkills() async {
    return await localDataSource.getSkills();
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    return await localDataSource.getProjects();
  }
}
