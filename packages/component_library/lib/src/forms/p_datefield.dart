import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PDateField extends StatelessWidget {
  const PDateField({
    super.key,
    this.onChanged,
    this.initialDate,
    this.selectedDate,
    this.label,
    this.hintText,
  });

  final String? label;
  final String? hintText;
  final ValueChanged<DateTime>? onChanged;
  final DateTime? initialDate;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(labelText: label, hintText: hintText),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: TextEditingController(
                text: initialDate == null
                    ? ''
                    : DateFormat.yMEd().format(selectedDate ?? initialDate!),
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              final DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                onChanged?.call(date);
              }
            },
          ),
        ],
      ),
    );
  }
}
