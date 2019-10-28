import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:interface_corda/data/data.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Últimas máquinas compartilhadas pelo Bradesco',
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.red,
              thickness: 3,
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: updateLista(),
              ),
            ),
            Text(
              'Status de Compartilhamento',
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.white,
              thickness: 3,
            ),
            Flexible(
              flex: 1,
              child: updateTable(),
            ),
          ],
        ),
      ),
    );
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
            var _counter = content.length;
            return ListView.builder(
                itemCount: _counter,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      detailsMachine(context,
                          content[index]["hashSharedMachine"].toString());
                    },
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'ID Máquina: ' +
                                content[index]["hashSharedMachine"].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          content[index]["operationType"].toString() == "1"
                              ? Text('Status: COMPROMETIDA',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))
                              : Text('Status: SUSPEITA',
                                  style: TextStyle(
                                      color: Colors.yellow.shade800,
                                      fontWeight: FontWeight.bold)),
                          Text(
                              'Motivo: ' +
                                  content[index]["observation"].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              'Data/Hora: ' +
                                  content[index]["recordedTime"].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text('Nenhuma máquina compartilhada',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
  
  Widget updateTable() {
    return new FutureBuilder(
        future: getUrl(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List contentTable = snapshot.data;
            var _counterTable = contentTable.length;
            return ListView.builder(
                itemCount: _counterTable,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        child: Card(
                          color: Colors.white,
                          elevation: 3,
                          child: Table(
                            border: TableBorder.all(),
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Text(
                                    'ID Máquina',
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/bradesco_logo_lado.png',
                                  alignment: Alignment.center,
                                ),
                                Image.asset(
                                  'assets/images/logo-itau.png',
                                  height: 22,
                                  alignment: Alignment.center,
                                ),
                                Image.asset(
                                  'assets/images/santander-logo.png',
                                  alignment: Alignment.center,
                                ),
                                Image.asset(
                                  'assets/images/caixa-logo.png',
                                  height: 16,
                                  alignment: Alignment.center,
                                ),
                              ]),
                              TableRow(children: [
                                Text(
                                  contentTable[index]["hashSharedMachine"],
                                  textAlign: TextAlign.center,
                                ),
                                contentTable[index]["operationType"]
                                            .toString() ==
                                        "1"
                                    ? Container(
                                        color: Colors.red,
                                        child: Text(
                                          contentTable[index]["recordedTime"]
                                              .toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : Container(
                                        color: Colors.yellow,
                                        child: Text(
                                          contentTable[index]["recordedTime"]
                                              .toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                Text(
                                  '?',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  textAlign: TextAlign.center,
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                });
          } else {
            return Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text('Nenhum status carregado',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    new CircularProgressIndicator(backgroundColor: Colors.red),
                  ],
                ),
              ),
            );
          }
        });
  }

  Future<dynamic> getMachineInfo(String id) async {
    String apiUrl =
        "http://$host:$port/sharedmachineweb/api/nodes/machines/$id";

    http.Response responseInfo = await http.get(apiUrl);
    return json.decode(responseInfo.body);
  }

  void detailsMachine(BuildContext context, String id) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Informações da máquina',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              backgroundColor: Colors.blue.shade900,
              centerTitle: true,
            ),
            body: machineInfoList(id),
          );
        });
  }

  Widget machineInfoList(String machineId) {
    String id = machineId;
    return new FutureBuilder(
        future: getMachineInfo(id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return Container(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Hardware: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    subtitle: Text(content["sharedMachineBean"]["deviceInfo"]
                            ["hardware"]
                        .toString()),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('OS: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    subtitle: Text(content["sharedMachineBean"]["deviceInfo"]
                            ["os"]
                        .toString()),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('SIM: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    subtitle: Text(content["sharedMachineBean"]["deviceInfo"]
                            ["sim"][0]
                        .toString()),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('COMP: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    subtitle: Text(content["sharedMachineBean"]["deviceInfo"]
                            ["comp"]
                        .toString()),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text('Carregando informações',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    new CircularProgressIndicator(backgroundColor: Colors.red),
                  ],
                ),
              ),
            );
          }
        });
  }
  
}
