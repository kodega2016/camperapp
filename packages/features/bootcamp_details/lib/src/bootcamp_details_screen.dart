import 'package:flutter/material.dart';

class BootcampDetailsScreen extends StatelessWidget {
  const BootcampDetailsScreen({super.key, required this.bootcampId});
  final String bootcampId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bootcamp Details'),
      ),
      body: const Center(
        child: Text('Bootcamp Details Screen'),
      ),
    );
  }
}
