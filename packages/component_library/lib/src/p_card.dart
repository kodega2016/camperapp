import 'package:flutter/material.dart';

class PCard extends StatelessWidget {
  const PCard({
    super.key,
    required this.child,
    this.elevation = 4.0,
    this.borderRadius = 8.0,
  });
  final Widget child;
  final double elevation;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
