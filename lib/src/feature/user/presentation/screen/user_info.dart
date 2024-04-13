import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfo extends ConsumerStatefulWidget {
  final String username;

  const UserInfo({super.key, required this.username});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserInfoState();
}

class _UserInfoState extends ConsumerState<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              'assets/profile_image.png',
            ), // Replace with actual image
          ),
          const SizedBox(height: 16),
          Text(
            widget.username,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Email: user@example.com', // Replace with actual email
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          // Add more user details here (bio, location, etc.)
        ],
      ),
    );
  }
}
