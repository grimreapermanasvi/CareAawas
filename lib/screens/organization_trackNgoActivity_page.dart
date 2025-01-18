import 'package:flutter/material.dart';

class TrackNgoActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track NGO Activity',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle('Activity Overview'),
            _buildActivityOverview(),
            _buildSectionTitle('Recent Activities'),
            _buildRecentActivities(),
            _buildSectionTitle('Reports and Analytics'),
            _buildReportsAnalytics(),
            _buildSectionTitle('Activity Logs'),
            _buildActivityLogs(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActivityOverview() {
    // This could be a simple summary of key stats like number of patients treated, etc.
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Total Patients Treated: 120'),
            SizedBox(height: 8.0),
            Text('Total Doctors Added: 15'),
            SizedBox(height: 8.0),
            Text('Events Held: 5'),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    // Display a list of recent activities like adding doctors, patients, etc.
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ListTile(
              title: Text('Doctor Dr. John added to the system'),
              subtitle: Text('Date: 2025-01-10'),
            ),
            ListTile(
              title: Text('Patient Rajesh Kumar registered'),
              subtitle: Text('Date: 2025-01-09'),
            ),
            ListTile(
              title: Text('Event on Addiction Awareness conducted'),
              subtitle: Text('Date: 2025-01-05'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportsAnalytics() {
    // Placeholder for reports and analytics, could use charts or stats.
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly Report: January 2025',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Here, you can use a chart package to display performance data, for example:
            // - Patients treated this month
            // - Number of new doctors
            // - Event participation rates
            const Text('Patient Treatment Progress: 75%'),
            const SizedBox(height: 8.0),
            const Text('Doctor Registration Rate: 80%'),
            const SizedBox(height: 8.0),
            const Text('Event Attendance: 90%'),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityLogs() {
    // Display logs of actions taken by the organization.
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ListTile(
              title: Text('Action: Patient added'),
              subtitle: Text('Performed by: Admin | Date: 2025-01-10'),
            ),
            ListTile(
              title: Text('Action: Doctor added'),
              subtitle: Text('Performed by: Admin | Date: 2025-01-09'),
            ),
            ListTile(
              title: Text('Action: Event conducted'),
              subtitle: Text('Performed by: Admin | Date: 2025-01-05'),
            ),
          ],
        ),
      ),
    );
  }
}
