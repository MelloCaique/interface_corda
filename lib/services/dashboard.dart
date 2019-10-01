import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:interface_corda/data/data.dart';
import 'package:interface_corda/widgets/fchart.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Card(
              elevation: 3,
              color: Colors.grey.withOpacity(0.1),
              child: ListTile(
                  title: updateLista(),
                  subtitle: Text("Amount of transactions"),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "$numtx",
                      style: TextStyle(color: Colors.black),
                    ),
                  ))),
          ChartApp(),
        ],
      ),
    );
  }

  Future<Map> getUrl() async {
    String apiUrl = "http://$host:$port/api/example/me";

    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  Widget updateLista() {
    return new FutureBuilder(
        future: getUrl(),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            var _me = content["me"];
            print(_me);
            return Text(_me);
          } else {
            print("nao deu");
            return new CircularProgressIndicator(
              backgroundColor: Colors.white,
            );
          }
        });
  }
}
