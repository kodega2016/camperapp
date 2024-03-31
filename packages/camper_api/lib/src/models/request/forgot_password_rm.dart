import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_rm.g.dart';

@JsonSerializable(createFactory: false)
class ForgotPasswordRM {
  final String email;
  const ForgotPasswordRM({required this.email});

  Map<String, dynamic> toJson() => _$ForgotPasswordRMToJson(this);
}
