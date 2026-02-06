import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class HoverTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HoverTextButton({super.key, required this.text, required this.onTap});

  @override
  State<HoverTextButton> createState() => _HoverTextButtonState();
}

class _HoverTextButtonState extends State<HoverTextButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: theme.textTheme.bodyLarge!.copyWith(
            fontWeight: isHovered ? FontWeight.bold : FontWeight.w500,
            color: isHovered
                ? AppColors.primary
                : theme.textTheme.bodyLarge?.color,
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
