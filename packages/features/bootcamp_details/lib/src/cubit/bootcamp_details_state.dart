part of 'bootcamp_details_cubit.dart';

@immutable
sealed class BootcampDetailsState {}

final class BootcampDetailsInitial extends BootcampDetailsState {}

final class BootcampDetailsLoading extends BootcampDetailsState {}

final class BootcampDetailsLoaded extends BootcampDetailsState {
  final Bootcamp bootcamp;

  BootcampDetailsLoaded(this.bootcamp);
}

final class BootcampDetailsError extends BootcampDetailsState {
  final String message;

  BootcampDetailsError(this.message);
}
