import 'package:bootcamp_detail/src/cubit/bootcamp_details_cubit.dart';
import 'package:bootcamp_repository/bootcamp_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BootcampDetailsScreen extends StatelessWidget {
  const BootcampDetailsScreen({
    super.key,
    required this.bootcampId,
    required this.bootCampRepository,
  });
  final BootCampRepository bootCampRepository;
  final String bootcampId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BootcampDetailsCubit(
        bootCampRepository: bootCampRepository,
        bootcampId: bootcampId,
      ),
      child: const BootcampDetailsView(),
    );
  }
}

class BootcampDetailsView extends StatelessWidget {
  const BootcampDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bootcamp Details'),
      ),
      body: BlocConsumer<BootcampDetailsCubit, BootcampDetailsState>(
        listener: (context, state) {
          if (state is BootcampDetailsError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
          }
        },
        builder: (context, state) {
          if (state is BootcampDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BootcampDetailsLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.bootcamp.name),
                  Text(state.bootcamp.description),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
