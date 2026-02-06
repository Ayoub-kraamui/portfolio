import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isOutline;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );

    if (isOutline) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon != null ? Icon(icon, size: 20) : const SizedBox.shrink(),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon, size: 20) : const SizedBox.shrink(),
      label: Text(label),
      style: style,
    );
  }
}
