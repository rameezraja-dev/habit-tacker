import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue.shade700,
                child: const Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Demo User',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text('demo@habitt.com', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 24),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Name'),
                      subtitle: const Text('Demo User'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Email'),
                      subtitle: const Text('demo@habitt.com'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.cake),
                      title: const Text('Age'),
                      subtitle: const Text('25'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.public),
                      title: const Text('Country'),
                      subtitle: const Text('United States'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}