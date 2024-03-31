import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({super.key, required this.onSignOut});
  final Function() onSignOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Profile'),
              onTap: () {},
              leading: const Icon(Ionicons.person_outline),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {},
              leading: const Icon(Ionicons.settings_outline),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                onSignOut();
              },
              leading: const Icon(Ionicons.log_out_outline),
            ),
          ],
        ),
      ),
    );
  }
}
