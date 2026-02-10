import 'package:flutter/material.dart';
import 'package:portfolio/shared/widgets/portfolio_logo.dart';

class NavBarMobile extends StatelessWidget {
  final void Function(int) onNavItemTap;

  const NavBarMobile({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PortfolioLogo(isMobile: true),
          PopupMenuButton<int>(
            icon: const Icon(Icons.menu_rounded),
            onSelected: onNavItemTap,
            itemBuilder: (context) => const [
              PopupMenuItem(value: 0, child: Text('Home')),
              PopupMenuItem(value: 1, child: Text('About Me')),
              PopupMenuItem(value: 2, child: Text('Experience')),
              PopupMenuItem(value: 3, child: Text('Skills')),
              PopupMenuItem(value: 4, child: Text('Projects')),
              PopupMenuItem(value: 5, child: Text('Contact Me')),
            ],
          ),
        ],
      ),
    );
  }
}
