import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/view/homescreen.dart';
import 'package:taniku/view/profil.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedNav = 0;
  final List _widgetOption = [
    const HomePage(),
    const ProfilPage(),
  ];

  void _changeSelectedNav(int index) {
    setState(() {
      _selectedNav = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_selectedNav),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.assignment),
          //   label: 'Pesanan',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.mail),
          //   label: 'Inbox',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedNav,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.red,
        showUnselectedLabels: true,
        onTap: _changeSelectedNav,
      ),
    );
  }
}
