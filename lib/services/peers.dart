import 'package:flutter/material.dart';

class Peers extends StatefulWidget {
  @override
  _PeersState createState() => _PeersState();
}

class _PeersState extends State<Peers> {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [Colors.blue.shade900, Colors.blueGrey, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.6, 1.0],
            tileMode: TileMode.mirror),
      ),
      
    );
  }
}