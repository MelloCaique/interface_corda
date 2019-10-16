import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interface_corda/data/data.dart';

class SharedMachines extends StatefulWidget {
  @override
  _SharedMachinesState createState() => _SharedMachinesState();
}

class _SharedMachinesState extends State<SharedMachines> {
  @override
  Widget build(BuildContext context) {
    return 
      updateLista()
    ;
  }

  Future<dynamic> getUrl() async {
    String apiUrl =
        "http://$host:$port/sharedmachineweb/api/nodes/machines?pageSize=4&pageNumber=1&sort=1&typeSort=0&stateStatus=0&statusOpType=0";

    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  Widget updateLista() {
    return new FutureBuilder(
        future: getUrl(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List content = snapshot.data;
            print(content);
            var _counter = content.length;
            return ListView.builder(
                itemCount: _counter,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      elevation: 3,
                      color: Colors.white.withOpacity(0.1),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'ID Máquina: ' + content[index]["hashSharedMachine"]
                                      .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('Status: ' + content[index]["operationType"].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text('Motivo: '+ content[index]["observation"].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text('Data/Hora: '+content[index]["recordedTime"].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),                
                      );
                });
          } else {
            return Container(
              child: Text('Nenhuma máquina compartilhada',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            );
          }
        });
  }
}
