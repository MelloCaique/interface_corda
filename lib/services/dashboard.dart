import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:interface_corda/widgets/shared_machines.dart';

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
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.red,
              thickness: 3,
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: ListView(
                  children: <Widget>[
                    SharedMachines(),
                  ],
                ),
              ),
            ),
             Text(
              'Status de Compartilhamento',
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.white,
              thickness: 3,
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Card(
                      color: Colors.white,
                      elevation: 3,
                      child: 
                          Table(
                            border: TableBorder.all(),
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text('ID Máquina', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                  Image.asset('assets/images/bradesco_logo_lado.png',alignment: Alignment.center,),
                                  Image.asset('assets/images/logo-itau.png',height: 22,alignment: Alignment.center,),
                                  Image.asset('assets/images/santander-logo.png',alignment: Alignment.center,),
                                  Image.asset('assets/images/caixa-logo.png',height: 16,alignment: Alignment.center,),
                                ]
                              ),
                             TableRow(
                               children: [
                                 Text('123', textAlign: TextAlign.center,),
                                 Text('17/10/2019 11:34hrs', textAlign: TextAlign.center,),
                                 Text('?', textAlign: TextAlign.center,),
                                 Text('?', textAlign: TextAlign.center,),
                                 Text('?', textAlign: TextAlign.center,),
                               ]
                             )
                            ],
                          ),
                    ),
                  ),
                  Container(
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: [
                              Text('Total Comprometida', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('Total Suspeita', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold),),
                            ]
                          ),
                          TableRow(
                            children: [
                              Text('1', textAlign: TextAlign.center,),
                              Text('?', textAlign: TextAlign.center,),
                            ]
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//Future<Map> getUrl() async {
//String apiUrl = "http://$host:$port/api/example/me";
//
//    http.Response response = await http.get(apiUrl);
//    return json.decode(response.body);
//  }

//  Widget updateLista() {
//    return new FutureBuilder(
//        future: getUrl(),
//        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
//          if (snapshot.hasData) {
//            Map content = snapshot.data;
//            var _me = content["me"];
//            print(_me);
//            return Text(_me);
//          } else {
//            print("nao deu");
//            return new CircularProgressIndicator(
//              backgroundColor: Colors.white,
//           );
//          }
//       });
//  }
}
