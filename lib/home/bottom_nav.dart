import 'package:flutter/material.dart';
import 'package:mathuram/home/branch.dart';
import 'package:mathuram/home/home_screen.dart';
import 'package:mathuram/home/social_media.dart';
import 'package:mathuram/view%20plan/view_plan.dart';

class BottomNavigationScreen extends StatefulWidget {
  final int initialIndex; // 👈 Accept index

  const BottomNavigationScreen({super.key, this.initialIndex = 0});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ChitFundTablePage(),
    BranchesScreen(),
    SocialMediaScreen()
  ];
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // 👈 Use the passed index
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFF00558B),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500,fontSize: 10),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          _buildNavItem('assets/bot1.png', 'Home', 0),
          _buildNavItem('assets/bot2.png', 'Schemes', 1),
          _buildNavItem('assets/bot3.png', 'Branches', 2),
          _buildNavItem('assets/bot4.png', 'Social Media', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String iconPath, String label, int index) {
    bool isSelected = _currentIndex == index;

    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Image.asset(iconPath, width: 20, height: 20),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.only(top: 4),
            height: 3,
            width: isSelected ? 20 : 0,
            decoration: BoxDecoration(
              color: const Color(0xFF00558B),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
      label: label,
    );
  }
}
