import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
            _buildSectionHeader('Appearance'),
            _buildSettingTile(
              icon: Icons.dark_mode,
              title: 'Dark Mode',
              subtitle: 'Enable dark theme',
              trailing: Switch(
                value: false,
                onChanged: (value) {},
                activeColor: Colors.blue.shade700,
              ),
            ),
            const Divider(),
            _buildSectionHeader('Notifications'),
            _buildSettingTile(
              icon: Icons.notifications,
              title: 'Push Notifications',
              subtitle: 'Receive reminders',
              trailing: Switch(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.blue.shade700,
              ),
            ),
            _buildSettingTile(
              icon: Icons.schedule,
              title: 'Daily Reminder',
              subtitle: '8:00 AM',
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(),
            _buildSectionHeader('Account'),
            _buildSettingTile(
              icon: Icons.lock,
              title: 'Change Password',
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.delete_forever,
              title: 'Delete Account',
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
              textColor: Colors.red,
            ),
            const Divider(),
            _buildSectionHeader('About'),
            _buildSettingTile(
              icon: Icons.info,
              title: 'Version',
              subtitle: '1.0.0',
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

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Colors.blue.shade700),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}