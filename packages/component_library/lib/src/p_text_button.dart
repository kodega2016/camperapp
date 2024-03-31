import 'package:flutter/material.dart';

class PTextButton extends StatelessWidget {
  const PTextButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;

  PTextButton.inProgress({
    Key? key,
    required String label,
  }) : this(
          key: key,
          label: label,
          icon: Transform.scale(
            scale: 0.5,
            child: const CircularProgressIndicator(),
          ),
        );

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    return icon != null
        ? TextButton.icon(
            onPressed: onPressed,
            icon: icon,
            label: Text(label),
          )
        : TextButton(
            onPressed: onPressed,
            child: Text(label),
          );
  }
}
