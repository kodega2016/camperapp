import 'package:bootcamp_repository/bootcamp_repository.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bootcamp_details_state.dart';

class BootcampDetailsCubit extends Cubit<BootcampDetailsState> {
  BootcampDetailsCubit({
    required this.bootCampRepository,
    required this.bootcampId,
  }) : super(BootcampDetailsInitial()) {
    getBootcamp();
  }
  final BootCampRepository bootCampRepository;
  final String bootcampId;

  Future<void> getBootcamp() async {
    emit(BootcampDetailsLoading());
    try {
      final bootcamp = await bootCampRepository.getBootCamp(bootcampId);
      emit(BootcampDetailsLoaded(bootcamp));
    } catch (e) {
      emit(BootcampDetailsError(e.toString()));
    }
  }
}
