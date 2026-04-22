import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Weekly Progress',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Simple bar chart using containers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildBar('Mon', 0.6),
                  _buildBar('Tue', 0.8),
                  _buildBar('Wed', 0.5),
                  _buildBar('Thu', 0.7),
                  _buildBar('Fri', 0.4),
                  _buildBar('Sat', 0.9),
                  _buildBar('Sun', 0.3),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Summary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Text('21',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            const Text('Total Tasks'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Text('85%',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            const Text('Completion'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Completed Tasks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildCompletedItem('Morning Exercise - 5 days ago'),
              _buildCompletedItem('Read 10 pages - 1 week ago'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBar(String day, double height) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 100 * height,
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(day, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildCompletedItem(String text) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.green),
        title: Text(text),
      ),
    );
  }
}