import 'package:flutter/material.dart';

import 'package:portfolio/shared/widgets/hover_text_button.dart';
import 'package:portfolio/shared/widgets/portfolio_logo.dart';

class NavBarWeb extends StatelessWidget {
  final void Function(int) onNavItemTap;

  const NavBarWeb({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      color: theme.scaffoldBackgroundColor.withValues(alpha: 0.9),
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
      child: Center(
        child: SizedBox(
          width: 1200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PortfolioLogo(),
              Row(
                children: [
                  HoverTextButton(text: 'Home', onTap: () => onNavItemTap(0)),
                  SizedBox(width: 32),
                  HoverTextButton(
                    text: 'About Me',
                    onTap: () => onNavItemTap(1),
                  ),
                  SizedBox(width: 32),
                  HoverTextButton(
                    text: 'Experience',
                    onTap: () => onNavItemTap(2),
                  ),
                  SizedBox(width: 32),
                  HoverTextButton(text: 'Skills', onTap: () => onNavItemTap(3)),
                  SizedBox(width: 32),
                  HoverTextButton(
                    text: 'Projects',
                    onTap: () => onNavItemTap(4),
                  ),
                  SizedBox(width: 32),

                  HoverTextButton(
                    text: 'Contact Me',
                    onTap: () => onNavItemTap(5),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
