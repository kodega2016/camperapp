import 'package:flutter/material.dart';

class PElevatedButton extends StatelessWidget {
  const PElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });
  static const double _elevatedButtonHeight = 48;

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;

  PElevatedButton.inProgress({
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

  ButtonStyle get _buttonStyle => ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    return SizedBox(
      width: double.infinity,
      height: _elevatedButtonHeight,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: icon,
              label: Text(label),
              style: _buttonStyle)
          : ElevatedButton(
              style: _buttonStyle,
              onPressed: onPressed,
              child: Text(label),
            ),
    );
  }
}
