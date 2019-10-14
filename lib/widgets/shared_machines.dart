import 'package:flutter/material.dart';

class SharedMachines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        color: Colors.white.withOpacity(0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('ID Máquina',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                Text('Status:',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Motivo',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Data/Hora',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("123",style: TextStyle(color: Colors.white,)),
                Text('CCOMPROMETIDA',style: TextStyle(color: Colors.white,)),
                Text('ROUBO',style: TextStyle(color: Colors.white,)),
                Text('17/10/2019 11:34hrs',style: TextStyle(color: Colors.white,),)
              ],
            )
          ],
        ));
  }
}
