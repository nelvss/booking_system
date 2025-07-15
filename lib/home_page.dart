import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTG Puerto Galera Travel And Tours',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;

  final List<Widget> _pages = [
    const DashboardPage(),
    const BookingsPage(),
    const ServicesPage(),
    const CustomersPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 38, 38),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/Logo.png',
              height: 48,
              width: 48,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.admin_panel_settings, size: 48);
              },
            ),
            const SizedBox(width: 12),
            const Text(
              'OTG Puerto Galera Travel And Tours',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 219, 38, 38),
                Color.fromARGB(255, 243, 33, 33),
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/Logo.png',
                      width: 80,
                      height: 80,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.admin_panel_settings,
                          size: 80,
                          color: Color.fromARGB(255, 219, 38, 38),
                        );
                      },
                    ),
                  ),
                ),
              ),
              _buildDrawerItem(icon: Icons.home, title: 'Home', index: 0),
              _buildDrawerItem(icon: Icons.info, title: 'About Us', index: 1),
              _buildDrawerItem(
                icon: Icons.contact_emergency,
                title: 'Contact Us',
                index: 2,
              ),
              _buildDrawerItem(
                icon: Icons.travel_explore,
                title: 'Services',
                index: 3,
              ),
              _buildDrawerItem(
                icon: Icons.book_online,
                title: 'Book Now',
                index: 4,
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    int? index,
    VoidCallback? onTap,
  }) {
    final isSelected = index != null && index == _selectedIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.white.withValues(alpha: 0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: AnimatedScale(
          scale: isSelected ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white70,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        onTap:
            onTap ??
            () {
              setState(() {
                _selectedIndex = index!;
              });
              // Trigger animation
              if (isSelected) {
                _animationController.forward().then((_) {
                  _animationController.reverse();
                });
              }
              Navigator.pop(context);
            },
      ),
    );
  }
}

// Placeholder pages for each tab
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Background 1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Background 1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Background 1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Background 1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Background 1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
