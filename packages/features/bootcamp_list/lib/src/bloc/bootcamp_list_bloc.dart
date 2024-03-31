import 'package:bootcamp_repository/bootcamp_repository.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bootcamp_list_event.dart';
part 'bootcamp_list_state.dart';

class BootcampListBloc extends Bloc<BootcampListEvent, BootcampListState> {
  final BootCampRepository bootCampRepository;
  BootcampListBloc({
    required this.bootCampRepository,
  }) : super(BootcampListInitial()) {
    on<BootcampListFetch>((event, emit) async {
      emit(BootcampListLoading());
      try {
        final bootcamps = await bootCampRepository.getBootCamps();
        emit(BootcampListLoaded(bootcamps));
      } catch (e) {
        emit(BootcampListError('Error loading bootcamps'));
      }
    });
  }
}
