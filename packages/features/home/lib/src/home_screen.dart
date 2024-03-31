import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userRepository});
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.apps_outline),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.bookmark_outline),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 8.0),
      //     child: Column(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.symmetric(
      //             horizontal: 16.0,
      //             vertical: 8.0,
      //           ),
      //           child: Column(
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(
      //                     "Dev Camper",
      //                     style: Theme.of(context).textTheme.headlineSmall,
      //                   ),
      //                   CircleAvatar(
      //                     radius: 20.0,
      //                     child: Icon(
      //                       Icons.person,
      //                       color: Theme.of(context).primaryColor,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(height: 16.0),
      //               const PTextFormField(
      //                 hintText: 'Search events here...',
      //               ),
      //               const SizedBox(height: 8.0),
      //             ],
      //           ),
      //         ),
      //         const Divider(),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(
      //             horizontal: 16.0,
      //           ),
      //           child: Column(
      //             children: [
      //               Row(
      //                 children: [
      //                   Text(
      //                     'Popular Events',
      //                     style: Theme.of(context).textTheme.titleMedium,
      //                   ),
      //                   const Spacer(),
      //                   TextButton(
      //                     onPressed: () {},
      //                     child: const Text('See More'),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
