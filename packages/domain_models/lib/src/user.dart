import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String? profileImageURL;

  User({
    required this.name,
    required this.email,
    this.profileImageURL,
  });

  @override
  List<Object?> get props => [name, email, profileImageURL];
}
