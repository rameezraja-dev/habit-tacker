import 'package:flutter/material.dart';
import '../menu/menu_drawer.dart';
import '../settings/settings_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  String _welcomeMessage = 'Welcome back!';
  String _userName = 'User';

  // Sample data for habits
  final List<Map<String, dynamic>> _todoHabits = [
    {'title': 'Morning Exercise', 'subtitle': 'Health', 'duration': '30 min', 'completed': false},
    {'title': 'Read 10 pages', 'subtitle': 'Learning', 'duration': '15 min', 'completed': false},
    {'title': 'Meditate 5 min', 'subtitle': 'Wellness', 'duration': '5 min', 'completed': false},
    {'title': 'Drink 8 glasses water', 'subtitle': 'Health', 'duration': 'All day', 'completed': false},
    {'title': 'Journaling', 'subtitle': 'Mindfulness', 'duration': '10 min', 'completed': false},
  ];

  final List<Map<String, dynamic>> _doneHabits = [
    {'title': 'Wake up early', 'subtitle': 'Health', 'duration': '6:00 AM', 'completed': true},
    {'title': 'Healthy breakfast', 'subtitle': 'Nutrition', 'duration': '15 min', 'completed': true},
    {'title': 'Walk 10,000 steps', 'subtitle': 'Fitness', 'duration': '60 min', 'completed': true},
  ];

  @override
  void initState() {
    super.initState();
    _setWelcomeMessage();
    _loadUserData();
  }

  void _setWelcomeMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      _welcomeMessage = 'Good morning!';
    } else if (hour < 17) {
      _welcomeMessage = 'Good afternoon!';
    } else {
      _welcomeMessage = 'Good evening!';
    }
  }

  Future<void> _loadUserData() async {
    // Load user name from local storage
    setState(() {
      _userName = 'Ric'; // Default name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Task 2: Top Navigation Bar
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Row(
          children: [
            Icon(Icons.track_changes, color: Colors.white),
            const SizedBox(width: 8),
            const Text('Habitt', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      // Task 2: Gradient background
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
              // Task 2: Welcome Section
              Text(
                'Hello, $_userName!',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Use the + button to create some habits!',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              
              // Task 3: Content Sections - To Do
              _buildSectionHeader('To Do'),
              const SizedBox(height: 12),
              ..._todoHabits.map((habit) => _buildHabitCard(habit)),
              
              const SizedBox(height: 24),
              
              // Task 3: Content Sections - Done
              _buildSectionHeader('Done'),
              const SizedBox(height: 12),
              ..._doneHabits.map((habit) => _buildHabitCard(habit)),
            ],
          ),
        ),
      ),
      // Task 2: Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade700,
        onPressed: () {
          // Add new habit action
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Task 3: Content Cards
  Widget _buildHabitCard(Map<String, dynamic> habit) {
    return GestureDetector(
      onTap: () {
        // Task 4: Navigate to detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(habitData: habit),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Task 3: Thumbnail/Image
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                habit['completed'] ? Icons.check_circle : Icons.circle_outlined,
                color: habit['completed'] ? Colors.green : Colors.blue.shade700,
              ),
            ),
            const SizedBox(width: 12),
            // Task 3: Title, Subtitle, Duration
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habit['title'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: habit['completed'] 
                          ? TextDecoration.lineThrough 
                          : null,
                    ),
                  ),
                  Text(
                    habit['subtitle'],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Task 3: Duration
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  habit['duration'],
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Task 3: Action Icons
                IconButton(
                  icon: Icon(
                    habit['completed'] 
                        ? Icons.check_circle 
                        : Icons.circle_outlined,
                    color: habit['completed'] 
                        ? Colors.green 
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      habit['completed'] = !habit['completed'];
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}