import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_strings.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';

class HeroSocialLinks extends StatelessWidget {
  const HeroSocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.linkedin),
          onPressed: () => context.read<PortfolioBloc>().add(
            const OpenLinkEvent('https://${AppStrings.linkedin}'),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.github),
          onPressed: () => context.read<PortfolioBloc>().add(
            const OpenLinkEvent('https://${AppStrings.github}'),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.envelope),
          onPressed: () => context.read<PortfolioBloc>().add(
            const OpenLinkEvent('mailto:${AppStrings.email}'),
          ),
        ),
      ],
    );
  }
}
