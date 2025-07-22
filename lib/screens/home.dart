import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectetedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Ini halaman Beranda')),
    Center(child: Text('Ini halaman Bookmark')),
    Center(child: Text('Ini halaman Cart')),
    Center(child: Text('Ini halaman Profile')), 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Flutter'),
      ),
      body: _pages[_selectetedIndex],
      bottomNavigationBar: NavigationBar(animationDuration: const Duration(
        milliseconds: 300
      ),
      selectedIndex: _selectetedIndex,
      onDestinationSelected: (index){
        setState(() {
          _selectetedIndex = index;
        });
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Beranda ',),
        NavigationDestination(icon: Icon(Icons.bookmark_outline_rounded), selectedIcon: Icon(Icons.bookmark_rounded), label: 'Bookmarks ',),
        NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), selectedIcon: Icon(Icons.shopping_bag), label: 'Cart ',),
        NavigationDestination(icon: Icon(Icons.person_outline_rounded), selectedIcon: Icon(Icons.person_rounded), label: 'Profile',),
      ],
      ),
    );
  }
}