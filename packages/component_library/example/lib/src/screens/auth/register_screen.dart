import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PTextFormField(
                label: "Full Name",
                hintText: "Enter your full name",
              ),
              const SizedBox(height: 10.0),
              const PTextFormField.email(
                label: "Email",
                hintText: "Enter your email",
              ),
              const SizedBox(height: 10.0),
              const PTextFormField.password(
                label: "Password",
              ),
              const SizedBox(height: 16.0),
              PElevatedButton(
                label: "Register",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
