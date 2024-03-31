import 'package:bootcamp_list/src/bloc/bootcamp_list_bloc.dart';
import 'package:bootcamp_repository/bootcamp_repository.dart';
import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BootcampListScreen extends StatelessWidget {
  const BootcampListScreen({
    super.key,
    required this.bootCampRepository,
    required this.onBootcampSelected,
  });
  final BootCampRepository bootCampRepository;
  final Function(Bootcamp) onBootcampSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BootcampListBloc(bootCampRepository: bootCampRepository)
            ..add(BootcampListFetch()),
      child: BootcampListView(
        onBootcampSelected: onBootcampSelected,
      ),
    );
  }
}

class BootcampListView extends StatelessWidget {
  const BootcampListView({super.key, required this.onBootcampSelected});
  final Function(Bootcamp) onBootcampSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dev Camper",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const PTextFormField(hintText: 'Search events here...'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Popular Events',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text('See More'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 190,
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return const BootcampListCard(
                              name: '',
                              description: '',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Upcoming Events',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text('See More'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 190,
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return const BootcampListCard(
                              name: '',
                              description: '',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    "Recommended Events",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                BlocBuilder<BootcampListBloc, BootcampListState>(
                  builder: (context, state) {
                    if (state is BootcampListInitial) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is BootcampListLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is BootcampListLoaded) {
                      return ListView.builder(
                        itemCount: state.bootcamps.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          final bootcamp = state.bootcamps[index];
                          return ListTile(
                            onTap: () => onBootcampSelected(bootcamp),
                            title: Text(bootcamp.name),
                            subtitle: Text(
                              bootcamp.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            isThreeLine: true,
                            leading: const Image(
                              image: NetworkImage(
                                'https://th.bing.com/th/id/OIP.0QoxrfLIdnqvhAA9dtARTgHaEH?rs=1&pid=ImgDetMain',
                              ),
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    } else if (state is BootcampListError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BootcampListCard extends StatelessWidget {
  const BootcampListCard({
    super.key,
    required this.name,
    required this.description,
  });
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: NetworkImage(
              'https://th.bing.com/th/id/OIP.0QoxrfLIdnqvhAA9dtARTgHaEH?rs=1&pid=ImgDetMain',
            ),
            height: 100,
            width: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4.0),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4.0),
                Text(
                  '12th - 14th March 2022',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
