import 'package:flutter/material.dart';

class PFilledButton extends StatelessWidget {
  const PFilledButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  static const double _buttonHeight = 48;
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;

  PFilledButton.inProgress({
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
    return SizedBox(
      width: double.infinity,
      height: _buttonHeight,
      child: icon != null
          ? FilledButton.icon(
              onPressed: onPressed,
              icon: icon,
              label: Text(label),
            )
          : FilledButton(
              onPressed: onPressed,
              child: Text(label),
            ),
    );
  }
}
