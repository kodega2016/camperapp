part of 'sign_in_cubit_cubit.dart';

@immutable
class SignInCubitState extends Equatable {
  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final bool isFormValid;

  const SignInCubitState({
    this.email = const Email.unvalidated(),
    this.password = const Password.unvalidated(),
    this.status = FormzSubmissionStatus.initial,
    this.isFormValid = false,
  });

  SignInCubitState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isFormValid,
  }) {
    return SignInCubitState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        status,
        isFormValid,
      ];
}
