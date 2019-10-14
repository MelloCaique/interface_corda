import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:interface_corda/data/data.dart';

class Vault extends StatefulWidget {
  @override
  _VaultState createState() => _VaultState();
}

class _VaultState extends State<Vault> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //child: updateLista(),
      ),
    );
  }

  /*Future<dynamic> getUrl() async {
    String apiUrl = "http://$host:$port/api/example/ious";

    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
 */ }

 /* Widget updateLista() {
    return Scaffold(
      body: new FutureBuilder(
          future: getUrl(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List content = snapshot.data;
              var _counter = content.length;
              numtx = content.length;
              print(content.toString());
              return Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        height: 40,
                        color: Colors.grey,
                        child: Center(
                            child: Text(
                          "Vault",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))),
                    Flexible(
                      child: new ListView.builder(
                          itemCount: _counter,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    updateInfo(
                                      context,
                                      content[index]['state']['data']["@class"]
                                          .toString(),
                                      content[index]['state']['data']
                                              ['linearId']["id"]
                                          .toString(),
                                      content[index]['state']['contract']
                                          .toString(),
                                      content[index]['state']['notary']
                                          .toString(),
                                      content[index]['state']['constraint']
                                              ['key']
                                          .toString(),
                                      content[index]['ref']["txhash"]
                                          .toString(),
                                    );
                                  },
                                  child: new Card(
                                      elevation: 5,
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.3),
                                          child: Text(
                                            content[index]["state"]["data"]
                                                    ["value"]
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        title: Text("From: " +
                                            content[index]["state"]["data"]
                                                    ["lender"]
                                                .toString()),
                                        subtitle: Text("To: " +
                                            content[index]["state"]["data"]
                                                    ["borrower"]
                                                .toString()),
                                      )),
                                ),
                                Divider(),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              );
            } else {
              return new CircularProgressIndicator(
                backgroundColor: Colors.white,
              );
            }
          }),
    );
  }
*/
  void updateInfo(BuildContext context, String clas, String id, String contract,
      String notary, String key, String txhash) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Infomations",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.grey.withOpacity(0.5),
            ),
            body: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(txhash),
                  subtitle: Text("Transaction Hash"),
                ),
                Divider(),
                ListTile(
                  title: Text(clas),
                  subtitle: Text('Data type'),
                ),
                Divider(),
                ListTile(
                  title: Text(id),
                  subtitle: Text('Linear ID'),
                ),
                Divider(),
                ListTile(
                  title: Text(contract),
                  subtitle: Text('Contract Type'),
                ),
                Divider(),
                ListTile(
                  title: Text(notary),
                  subtitle: Text('Notary Service'),
                ),
                Divider(),
                ListTile(
                  title: Text(key),
                  subtitle: Text('Public Key'),
                ),
              ],
            ),
          );
        });
  //}
}
