import 'package:flutter/material.dart';

class PChoiceChip extends StatelessWidget {
  const PChoiceChip({
    super.key,
    required this.label,
    this.onSelected,
    this.selected = false,
    this.avatar,
  });
  final String label;
  final ValueChanged<bool>? onSelected;
  final bool selected;
  final Widget? avatar;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: avatar,
      shape: const StadiumBorder(side: BorderSide()),
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
    );
  }
}
