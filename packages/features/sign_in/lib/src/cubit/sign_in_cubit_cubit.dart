import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_cubit_state.dart';

class SignInCubitCubit extends Cubit<SignInCubitState> {
  final UserRepository userRepository;
  SignInCubitCubit({
    required this.userRepository,
  }) : super(const SignInCubitState());

  void emailChanged(String value) {
    final email = Email.validated(value);
    emit(state.copyWith(
      email: email,
      isFormValid: email.isValid && state.password.isValid,
    ));
  }

  void passwordChanged(String value) {
    final password = Password.validated(value);
    emit(state.copyWith(
      password: password,
      isFormValid: state.email.isValid && password.isValid,
    ));
  }

  void signIn() async {
    if (state.isFormValid) {
      try {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
        await userRepository.login(state.email.value, state.password.value);
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
