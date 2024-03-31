import 'package:equatable/equatable.dart';

class Bootcamp extends Equatable {
  final String id;
  final String name;
  final String description;

  Bootcamp({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [id, name, description];
}
