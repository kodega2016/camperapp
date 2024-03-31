import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32.0,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const PTextFormField.email(
                    label: "Email",
                    hintText: "Enter your email",
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "An email will be sent to you with instructions on how to reset your password.",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16.0),
                  PElevatedButton(
                    label: "Reset Password",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
