import 'package:flutter/material.dart';

class POutlineButton extends StatelessWidget {
  static const double _buttonHeight = 48;
  const POutlineButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;

  POutlineButton.inProgress({
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
          ? OutlinedButton.icon(
              onPressed: onPressed,
              icon: icon,
              label: Text(label),
            )
          : OutlinedButton(
              onPressed: () {},
              child: Text(label),
            ),
    );
  }
}
