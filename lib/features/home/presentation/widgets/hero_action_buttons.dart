import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_strings.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../../../../shared/widgets/custom_button.dart';

class HeroActionButtons extends StatelessWidget {
  final double width;

  const HeroActionButtons({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return width > 500
        ? Row(
            children: [
              CustomButton(
                label: AppStrings.downloadCv,
                icon: Icons.download,
                onPressed: () {
                  context.read<PortfolioBloc>().add(DownloadCvEvent());
                },
              ),
              const SizedBox(width: 16),
              CustomButton(
                label: AppStrings.githubProfile,
                icon: FontAwesomeIcons.github,
                isOutline: true,
                onPressed: () => context.read<PortfolioBloc>().add(
                  const OpenLinkEvent('https://${AppStrings.github}'),
                ),
              ),
            ],
          )
        : Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: AppStrings.downloadCv,
                  icon: Icons.download,
                  onPressed: () {
                    context.read<PortfolioBloc>().add(DownloadCvEvent());
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: AppStrings.githubProfile,
                  icon: FontAwesomeIcons.github,
                  isOutline: true,
                  onPressed: () => context.read<PortfolioBloc>().add(
                    const OpenLinkEvent('https://${AppStrings.github}'),
                  ),
                ),
              ),
            ],
          );
  }
}
