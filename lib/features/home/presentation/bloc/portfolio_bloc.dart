import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../../../../core/services/url_launcher_service.dart';

import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final PortfolioRepository repository;
  final UrlLauncherService urlLauncherService;

  PortfolioBloc({required this.repository, required this.urlLauncherService})
    : super(const PortfolioState()) {
    on<LoadPortfolioData>(_onLoadData);
    on<OpenLinkEvent>(_onOpenLink);
    on<DownloadCvEvent>(_onDownloadCv);
  }

  Future<void> _onLoadData(
    LoadPortfolioData event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(state.copyWith(status: PortfolioStatus.loading));
    try {
      final experiences = await repository.getExperiences();
      final skills = await repository.getSkills();
      final projects = await repository.getProjects();

      emit(
        state.copyWith(
          status: PortfolioStatus.loaded,
          experiences: experiences,
          skills: skills,
          projects: projects,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: PortfolioStatus.error));
    }
  }

  Future<void> _onOpenLink(
    OpenLinkEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    try {
      await urlLauncherService.launchUrl(event.url);
    } catch (_) {
      // إما معالجة الخطأ أو عدم القيام بأي شيء.
    }
  }

  Future<void> _onDownloadCv(
    DownloadCvEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    try {
      await urlLauncherService.openCv();
    } catch (_) {
      // إما معالجة الخطأ أو عدم القيام بأي شيء.
    }
  }
}
