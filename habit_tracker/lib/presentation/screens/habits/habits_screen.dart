import 'package:flutter/material.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  _HabitsScreenState createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  final List<Map<String, dynamic>> _habits = [
    {'title': 'Morning Exercise', 'completed': true},
    {'title': 'Read 10 pages', 'completed': true},
    {'title': 'Meditate 5 min', 'completed': false},
    {'title': 'Drink 8 glasses water', 'completed': false},
  ];

  void _toggleTask(int index) {
    setState(() {
      _habits[index]['completed'] = !_habits[index]['completed'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _habits.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
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
        child: _habits.isEmpty
            ? const Center(child: Text('No tasks yet. Add one!'))
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _habits.length,
                itemBuilder: (context, index) {
                  final habit = _habits[index];
                  return Dismissible(
                    key: Key(index.toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) => _deleteTask(index),
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: Checkbox(
                          value: habit['completed'],
                          onChanged: (value) => _toggleTask(index),
                          activeColor: Colors.green,
                        ),
                        title: Text(
                          habit['title'],
                          style: TextStyle(
                            decoration: habit['completed']
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          _showTaskDetail(context, habit['title']);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade700,
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showTaskDetail(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Task Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Task: $title'),
            const SizedBox(height: 8),
            const Text('Description: Complete this task daily'),
            const SizedBox(height: 8),
            const Text('Due: Today'),
            const SizedBox(height: 8),
            const Text('Status: In Progress'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final titleController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Task'),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(
            hintText: 'Enter task title',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                setState(() {
                  _habits.add({
                    'title': titleController.text,
                    'completed': false,
                  });
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}