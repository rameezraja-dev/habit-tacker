import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/notification_provider.dart';
import '../../providers/habit_provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, notificationProvider, _) {
          return ListView(
            children: [
              _buildSectionHeader(context, 'Enable Notifications'),
              SwitchListTile(
                title: const Text('Push Notifications'),
                subtitle: const Text('Receive reminders for your habits'),
                value: notificationProvider.notificationsEnabled,
                onChanged: (value) {
                  notificationProvider.setNotificationsEnabled(value);
                },
              ),
              const Divider(),
              if (notificationProvider.notificationsEnabled) ...[
                _buildSectionHeader(context, 'Daily Reminder'),
                SwitchListTile(
                  title: const Text('Enable'),
                  value: true,
                  onChanged: (value) {},
                ),
                ListTile(
                  title: const Text('Time'),
                  subtitle: const Text('8:00 AM'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showTimePicker(context);
                  },
                ),
                _buildRepeatTile(),
                const Divider(),
                _buildSectionHeader(context, 'Calendar'),
                _buildCalendarPreview(context),
                const Divider(),
                _buildSectionHeader(context, 'Upcoming'),
                ..._buildUpcomingList(context),
              ],
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Version 1.0.0',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildRepeatTile() {
    return ListTile(
      title: const Text('Repeat'),
      subtitle: const Text('Every Day'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  Widget _buildCalendarPreview(BuildContext context) {
    final now = DateTime.now();
    final daysInWeek = List.generate(7, (index) {
      return now.subtract(Duration(days: now.weekday - 1 - index));
    }).reversed.toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: daysInWeek.map((date) {
          final isToday = date.day == now.day && date.month == now.month;
          return Column(
            children: [
              Text(
                ['M', 'T', 'W', 'T', 'F', 'S', 'S'][date.weekday - 1],
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 4),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isToday
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade200,
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: TextStyle(
                      color: isToday ? Colors.white : null,
                      fontWeight: isToday ? FontWeight.bold : null,
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
                  color: isToday
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  List<Widget> _buildUpcomingList(BuildContext context) {
    return [
      ListTile(
        leading: const Icon(Icons.notifications),
        title: const Text('Morning Reminder'),
        subtitle: const Text('8:00 AM - All selected habits'),
      ),
      ListTile(
        leading: const Icon(Icons.notifications),
        title: const Text('Evening Check-in'),
        subtitle: const Text('7:00 PM - Review progress'),
      ),
    ];
  }

  void _showTimePicker(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 8, minute: 0),
    );
    if (time != null) {
      // Save time preference
    }
  }
}