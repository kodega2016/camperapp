import 'package:flutter/material.dart';

class PTextFormField extends StatelessWidget {
  const PTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.errorText,
    this.textInputAction,
  });
  final String? label;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? errorText;
  final TextInputAction? textInputAction;

  const PTextFormField.password({
    Key? key,
    String? label,
    String? hintText,
    ValueChanged<String>? onChanged,
    String? errorText,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
  }) : this(
          obscureText: true,
          key: key,
          hintText: hintText,
          label: label,
          onChanged: onChanged,
          errorText: errorText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
        );

  const PTextFormField.email({
    Key? key,
    String? label,
    String? hintText,
    ValueChanged<String>? onChanged,
    String? errorText,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
  }) : this(
          key: key,
          hintText: hintText,
          label: label,
          keyboardType: TextInputType.emailAddress,
          onChanged: onChanged,
          errorText: errorText,
          textInputAction: textInputAction,
        );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        errorText: errorText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
