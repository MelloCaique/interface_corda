import 'package:flutter/material.dart';
import 'package:interface_corda/services/dashboard.dart';
import 'package:interface_corda/services/network.dart';
import 'package:interface_corda/services/transactions.dart';
import 'package:interface_corda/services/vault.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool open = false;
  int _currentIndex = 0;
  final List<Widget> _children = [
    Dashboard(),
    Vault(),
    Transactions(),
    Network(),
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
        title: Image.asset("assets/images/logo_escrito.png"),
        backgroundColor: Colors.black,
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
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
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
                  Icons.account_balance_wallet,
                  color: Colors.white,
                ),
                title: Text(
                  "Vault",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.compare_arrows,
                  color: Colors.white,
                ),
                title: Text(
                  "Transaction",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                title: Text(
                  "Network",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ]),
      body: _children[_currentIndex],
    );
  }
}
