import 'package:flutter/material.dart';
import 'package:interface_corda/services/dashboard.dart';
import 'package:interface_corda/services/transactions.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool open = false;
  int _currentIndex = 0;
  final List<Widget> _children = [
    Dashboard(),
    Transactions(),

  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
                  'ID Máquina Compartilhada',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                      ),
                ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.blue.shade900,
      ),
      bottomNavigationBar: BottomNavigationBar(
          
          backgroundColor: Colors.blue.shade900.withOpacity(0.75),
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                title: Text(
                  "Dashboard",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.mobile_screen_share,
                  color: Colors.white,
                ),
                title: Text(
                  "Share ID",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ]),
      body: _children[_currentIndex],
    );
  }
}
