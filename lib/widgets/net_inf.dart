import 'package:flutter/material.dart';

class NetInfo extends StatefulWidget {

  String name;
  String pubKey;
  String services;
  String location;

  NetInfo(this.name, this.pubKey, this.services, this.location);

  @override
  _NetInfoState createState() => _NetInfoState();

}

class _NetInfoState extends State<NetInfo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(0.1),
      child: ListTile(
        title: Text("${widget.name}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Column(
          children: <Widget>[
            Text("-Pub Key: ${widget.pubKey}", style: TextStyle(color: Colors.white)),
            Divider(
              color: Colors.white,
            ),
            Text("-Services: ${widget.services}", style: TextStyle(color: Colors.white)),
            Divider(
              color: Colors.white,
            ),
            Text("-Location: ${widget.location}", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}