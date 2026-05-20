import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.isPrimary = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
        label: Text(text),
        style: backgroundColor != null
            ? FilledButton.styleFrom(backgroundColor: backgroundColor)
            : null,
      );
    }

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
      label: Text(text),
    );
  }
}
