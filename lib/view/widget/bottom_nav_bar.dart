import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:market_place/view/adding_page/adding_page.dart';
import 'package:market_place/view/chat_page/chat_page.dart';
import 'package:market_place/view/favoraits_page/favoraits_page.dart';
import 'package:market_place/view/home/home_page.dart';
import 'package:market_place/view/profile_page/profile_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const FavoraitsPage(),
    const AddingPage(),
    const ChatPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          Icon(Icons.home),
          Icon(Icons.favorite_border),
          Icon(Icons.add_circle_outline_sharp),
          Icon(Icons.chat_bubble_outline),
          Icon(Icons.person),
        ],
        index: _selectedIndex,
        onTap: _navigateBottomBar,
      ),
    );
  }
}
