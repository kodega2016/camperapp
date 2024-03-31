import 'package:flutter/material.dart';

class PBadge extends StatelessWidget {
  const PBadge({
    super.key,
    required this.label,
    this.badgeColor = Colors.red,
    this.textColor = Colors.white,
  });

  final Widget label;
  final double _badgeSize = 24;
  final Color badgeColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Badge(
      textColor: textColor,
      smallSize: _badgeSize,
      largeSize: _badgeSize,
      label: label,
      backgroundColor: badgeColor,
    );
  }
}
