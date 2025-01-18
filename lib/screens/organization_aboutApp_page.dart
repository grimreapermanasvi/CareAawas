import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'Careआवास is a revolutionary app designed to assist NGOs, doctors, and patients in managing rehabilitation efforts effectively. '
          'It enables real-time monitoring, centralized data management, and streamlined communication. With features like language support, '
          'privacy settings, and notifications, Careआवास aims to make rehabilitation services accessible and efficient.',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
