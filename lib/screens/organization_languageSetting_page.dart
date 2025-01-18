import 'package:flutter/material.dart';

class LanguageSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Settings'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('English'),
            onTap: () {
              // Set language to English
            },
          ),
          ListTile(
            title: const Text('Hindi'),
            onTap: () {
              // Set language to Hindi
            },
          ),
          ListTile(
            title: const Text('Other Languages'),
            onTap: () {
              // Navigate to more language options
            },
          ),
        ],
      ),
    );
  }
}
