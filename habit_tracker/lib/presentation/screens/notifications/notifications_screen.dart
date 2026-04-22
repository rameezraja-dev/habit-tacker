import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            _buildSectionHeader('Enable Notifications'),
            SwitchListTile(
              title: const Text('Push Notifications'),
              subtitle: const Text('Receive reminders for your habits'),
              value: true,
              onChanged: (value) {},
              activeColor: Colors.blue.shade700,
            ),
            const Divider(),
            _buildSectionHeader('Daily Reminder'),
            SwitchListTile(
              title: const Text('Enable'),
              value: true,
              onChanged: (value) {},
              activeColor: Colors.blue.shade700,
            ),
            ListTile(
              title: const Text('Time'),
              subtitle: const Text('8:00 AM'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Repeat'),
              subtitle: const Text('Every Day'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(),
            _buildSectionHeader('Calendar'),
            _buildCalendarPreview(),
            const Divider(),
            _buildSectionHeader('Upcoming'),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Morning Reminder'),
              subtitle: Text('8:00 AM - All selected habits'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Evening Check-in'),
              subtitle: Text('7:00 PM - Review progress'),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Version 1.0.0',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade700,
        ),
      ),
    );
  }

  Widget _buildCalendarPreview() {
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final dates = [21, 22, 23, 24, 25, 26, 27];
    final hasNotification = [true, true, false, true, false, true, true];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (index) {
          return Column(
            children: [
              Text(
                days[index],
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 4),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hasNotification[index]
                      ? Colors.blue.shade700
                      : Colors.grey.shade200,
                ),
                child: Center(
                  child: Text(
                    '${dates[index]}',
                    style: TextStyle(
                      color: hasNotification[index]
                          ? Colors.white
                          : Colors.black,
                      fontWeight: hasNotification[index]
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hasNotification[index]
                      ? Colors.blue.shade700
                      : Colors.transparent,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}