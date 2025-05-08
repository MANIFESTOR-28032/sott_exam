import 'package:flutter/material.dart';

class NavigationBarExample extends StatefulWidget {
  const NavigationBarExample({Key? key}) : super(key: key);

  @override
  State<NavigationBarExample> createState() => _NavigationBarExampleState();
}

class _NavigationBarExampleState extends State<NavigationBarExample> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("Главная")),
    Center(child: Text("Поиск")),
    Center(child: Text("Чат")),
    Center(child: Text("Профиль")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        height: 70,
        backgroundColor: Colors.white,
        indicatorColor: Colors.amber.shade100,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Colors.amber),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.search, color: Colors.amber),
            label: 'Поиск',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble, color: Colors.amber),
            label: 'Чат',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Colors.amber),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
