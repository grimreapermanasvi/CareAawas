import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Show Notifications'),
              value: true,
              onChanged: (bool value) {
                // Toggle notification visibility
              },
            ),
            const SizedBox(height: 16.0),
            SwitchListTile(
              title: const Text('Mute Notifications'),
              value: false,
              onChanged: (bool value) {
                // Mute/unmute notifications
              },
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Implement mute duration logic
              },
              child: const Text('Set Mute Duration'),
            ),
          ],
        ),
      ),
    );
  }
}
