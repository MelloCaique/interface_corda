import 'package:flutter/material.dart';

class TableStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            
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
              );
  }
}