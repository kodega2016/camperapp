import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid, alreadyRegistered }

class Email extends FormzInput<String, EmailValidationError>
    with EquatableMixin {
  final bool isAlreadyRegistered;

  const Email.unvalidated([super.value = ''])
      : isAlreadyRegistered = false,
        super.pure();

  const Email.validated(super.value, {this.isAlreadyRegistered = false})
      : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    return value.isEmpty
        ? EmailValidationError.empty
        : (isAlreadyRegistered
            ? EmailValidationError.alreadyRegistered
            : (_emailRegExp.hasMatch(value)
                ? null
                : EmailValidationError.invalid));
  }

  @override
  List<Object?> get props => [value, isPure, isAlreadyRegistered];
}
