import 'package:equatable/equatable.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object> get props => [];
}

class LoadPortfolioData extends PortfolioEvent {}

class OpenLinkEvent extends PortfolioEvent {
  final String url;
  const OpenLinkEvent(this.url);
  @override
  List<Object> get props => [url];
}

class DownloadCvEvent extends PortfolioEvent {}
