import 'package:flutter/material.dart';

class InteractiveWidget extends StatefulWidget {
  final Widget child;
  final Widget? hoverChild;
  final VoidCallback? onTap;
  final double scale;

  const InteractiveWidget({
    super.key,
    required this.child,
    this.hoverChild,
    this.onTap,
    this.scale = 1.05,
  });

  @override
  State<InteractiveWidget> createState() => _InteractiveWidgetState();
}

class _InteractiveWidgetState extends State<InteractiveWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: _isHovered && widget.hoverChild != null
              ? widget.hoverChild
              : widget.child,
        ),
      ),
    );
  }
}
