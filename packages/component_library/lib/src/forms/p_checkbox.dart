import 'package:flutter/material.dart';

class PCheckBox extends StatelessWidget {
  const PCheckBox({super.key, this.label, required this.value, this.onChanged});

  final String? label;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final label = this.label;

    return label == null
        ? Checkbox(
            value: value,
            onChanged: onChanged,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: value,
                semanticLabel: label,
                onChanged: onChanged,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          );
  }
}
