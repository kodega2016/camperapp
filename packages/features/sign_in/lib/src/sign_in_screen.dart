import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';
import 'package:sign_in/src/cubit/sign_in_cubit_cubit.dart';
import 'package:user_repository/user_repository.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key, required this.userRepository, required this.onSignedIn});
  final UserRepository userRepository;
  final Function() onSignedIn;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubitCubit>(
      create: (context) => SignInCubitCubit(userRepository: userRepository),
      child:  SignInView(
        onSignedIn: onSignedIn,
        
        
      ),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key, required this.onSignedIn});
  final Function() onSignedIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: BlocConsumer<SignInCubitCubit, SignInCubitState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == FormzSubmissionStatus.success) {
                onSignedIn();
              } else if (state.status == FormzSubmissionStatus.failure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: const Text('Sign In failed'),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
              }
            },
            builder: (context, state) {
              final cubit = context.read<SignInCubitCubit>();
              final emailError =
                  (state.email.isNotValid) && (state.email.displayError != null)
                      ? state.email.error
                      : null;
              final passwordError = (state.password.isNotValid &&
                      (state.password.displayError != null))
                  ? state.password.error
                  : null;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PTextFormField.email(
                    label: "Email",
                    hintText: 'Enter your email',
                    onChanged: cubit.emailChanged,
                    textInputAction: TextInputAction.next,
                    errorText: emailError == null
                        ? null
                        : (emailError == EmailValidationError.empty
                            ? 'Email cannot be empty'
                            : 'Email must be a valid email address'),
                  ),
                  const SizedBox(height: 16),
                  PTextFormField.password(
                    label: "Password",
                    hintText: 'Enter your password',
                    onChanged: cubit.passwordChanged,
                    textInputAction: TextInputAction.done,
                    errorText: passwordError == null
                        ? null
                        : (passwordError == PasswordValidationError.empty
                            ? 'Password cannot be empty'
                            : 'Password must be at least 8 characters'),
                  ),
                  const SizedBox(height: 18),
                  state.status == FormzSubmissionStatus.inProgress
                      ? PElevatedButton.inProgress(label: 'Signing In')
                      : PElevatedButton(
                          label: 'Sign In',
                          icon: const Icon(Icons.login),
                          onPressed: state.isFormValid
                              ? () {
                                  // clear focus
                                  FocusScope.of(context).unfocus();
                                  cubit.signIn();
                                }
                              : null,
                        ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: PTextButton(
                      label: "Forgot Password?",
                      onPressed: () {},
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
