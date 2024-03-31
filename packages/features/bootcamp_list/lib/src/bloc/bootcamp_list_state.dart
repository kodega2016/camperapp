part of 'bootcamp_list_bloc.dart';

@immutable
sealed class BootcampListState {}

final class BootcampListInitial extends BootcampListState {}

final class BootcampListLoading extends BootcampListState {}

final class BootcampListLoaded extends BootcampListState {
  final List<Bootcamp> bootcamps;
  BootcampListLoaded(this.bootcamps);
}

final class BootcampListError extends BootcampListState {
  final String message;
  BootcampListError(this.message);
}
