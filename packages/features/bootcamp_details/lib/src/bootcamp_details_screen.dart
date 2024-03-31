import 'package:bootcamp_detail/src/cubit/bootcamp_details_cubit.dart';
import 'package:bootcamp_repository/bootcamp_repository.dart';
import 'package:component_library/component_library.dart';
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
      body: Stack(
        children: [
          BlocConsumer<BootcampDetailsCubit, BootcampDetailsState>(
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
                  padding: const EdgeInsets.symmetric(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: NetworkImage(
                          'http://192.168.105.1:5000/uploads/${state.bootcamp.photo}',
                        ),
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.bootcamp.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              state.bootcamp.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              "Location: ${state.bootcamp.location.formattedAddress}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8.0),
                            Card(
                              elevation: 0.2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            PElevatedButton(
                              label: "RSVP for this Bootcamp",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16),
            child: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
