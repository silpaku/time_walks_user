import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:time_walks/home/cart.dart';
import 'package:time_walks/home/home.dart';
import 'package:time_walks/home/profile.dart';
import 'package:time_walks/home/wishlist.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<dynamic> tablist = [
     Home_page(),
    const My_cart(),
    const Wishlist(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.black,
          color: Colors.white,
          
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.home,
              color: Colors.black,
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
          ]),
      body: tablist[_currentIndex],
    );
  }
}
