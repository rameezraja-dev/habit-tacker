import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/habit_provider.dart';
import '../../../data/models/habit_model.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddHabitScreen()),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Today'),
            Tab(text: 'Weekly'),
            Tab(text: 'Done'),
          ],
        ),
      ),
      body: Consumer<HabitProvider>(
        builder: (context, habitProvider, _) {
          return TabBarView(
            controller: _tabController,
            children: [
              _buildHabitList(habitProvider.habits, habitProvider),
              _buildHabitList(habitProvider.pendingHabits, habitProvider),
              _buildHabitList(habitProvider.habits, habitProvider),
              _buildHabitList(habitProvider.completedHabits, habitProvider),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddHabitScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildHabitList(List<Habit> habits, HabitProvider provider) {
    if (habits.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text('No tasks yet'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddHabitScreen()),
                );
              },
              child: const Text('Add your first task'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        return Dismissible(
          key: Key(habit.id),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            color: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Delete Task'),
                content: Text('Are you sure you want to delete "${habit.name}"?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Delete'),
                  ),
                ],
              ),
            );
          },
          onDismissed: (direction) {
            provider.deleteHabit(habit.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${habit.name} deleted')),
            );
          },
          child: Card(
            child: ListTile(
              leading: Checkbox(
                value: habit.isCompleted,
                onChanged: (value) {
                  provider.toggleHabitCompletion(habit.id);
                },
              ),
              title: Text(
                habit.name,
                style: TextStyle(
                  decoration: habit.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.repeat,
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(habit.frequency),
                  if (habit.notifyEnabled) ...[
                    const SizedBox(width: 8),
                    Icon(
                      Icons.notifications_active,
                      size: 14,
                      color: Colors.grey,
                    ),
                  ],
                ],
              ),
              trailing: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Color(habit.color),
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddHabitScreen(habit: habit),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class AddHabitScreen extends StatefulWidget {
  final Habit? habit;

  const AddHabitScreen({super.key, this.habit});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _frequency = 'Daily';
  int _color = 0xFF6366F1;
  bool _notifyEnabled = true;
  List<String> _notificationTimes = ['Morning'];

  final List<String> _frequencies = ['Daily', 'Weekly', 'Monthly'];

  @override
  void initState() {
    super.initState();
    if (widget.habit != null) {
      _nameController.text = widget.habit!.name;
      _descriptionController.text = widget.habit!.description;
      _frequency = widget.habit!.frequency;
      _color = widget.habit!.color;
      _notifyEnabled = widget.habit!.notifyEnabled;
      _notificationTimes = List.from(widget.habit!.notificationTimes);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      final habitProvider = context.read<HabitProvider>();
      
      if (widget.habit != null) {
        final updatedHabit = widget.habit!.copyWith(
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim(),
          frequency: _frequency,
          color: _color,
          notifyEnabled: _notifyEnabled,
          notificationTimes: _notificationTimes,
        );
        await habitProvider.updateHabit(updatedHabit);
      } else {
        await habitProvider.addHabit(
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim(),
          frequency: _frequency,
          color: _color,
          notifyEnabled: _notifyEnabled,
          notificationTimes: _notificationTimes,
        );
      }

      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habit != null ? 'Edit Task' : 'Add Task'),
        actions: [
          TextButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Task Title',
                hintText: 'Enter task name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter task description',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Frequency',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            SegmentedButton<String>(
              segments: _frequencies.map((f) => ButtonSegment(value: f, label: Text(f))).toList(),
              selected: {_frequency},
              onSelectionChanged: (selection) {
                setState(() {
                  _frequency = selection.first;
                });
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Reminder Time',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _notifyEnabled,
              onChanged: (value) {
                setState(() {
                  _notifyEnabled = value;
                });
              },
            ),
            if (_notifyEnabled) ...[
              Wrap(
                spacing: 8,
                children: [
                  FilterChip(
                    label: const Text('Morning'),
                    selected: _notificationTimes.contains('Morning'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _notificationTimes.add('Morning');
                        } else {
                          _notificationTimes.remove('Morning');
                        }
                      });
                    },
                  ),
                  FilterChip(
                    label: const Text('Afternoon'),
                    selected: _notificationTimes.contains('Afternoon'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _notificationTimes.add('Afternoon');
                        } else {
                          _notificationTimes.remove('Afternoon');
                        }
                      });
                    },
                  ),
                  FilterChip(
                    label: const Text('Evening'),
                    selected: _notificationTimes.contains('Evening'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _notificationTimes.add('Evening');
                        } else {
                          _notificationTimes.remove('Evening');
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
            const SizedBox(height: 24),
            Text(
              'Color',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                0xFF6366F1,
                0xFF10B981,
                0xFFF59E0B,
                0xFFEF4444,
                0xFF8B5CF6,
                0xFFEC4899,
                0xFF06B6D4,
                0xFF84CC16,
              ].map((color) => GestureDetector(
                onTap: () {
                  setState(() {
                    _color = color;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(color),
                    shape: BoxShape.circle,
                    border: _color == color
                        ? Border.all(color: Colors.black, width: 3)
                        : null,
                  ),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}