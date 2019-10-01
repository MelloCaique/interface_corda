import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final _peerController = new TextEditingController();
  final _valueController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              color: Colors.grey.withOpacity(0.2),
              child: Container(
                height: 350,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Add new IOU',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Divider(height: 10, color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new PhysicalModel(
                        color: Colors.white,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0,
                        child: TextFormField(
                          controller: _peerController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "   Error";
                            }
                          },
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Counter-Party",
                            hintStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            fillColor: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new PhysicalModel(
                        color: Colors.white,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0,
                        child: TextFormField(
                          controller: _valueController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "   Error";
                            }
                          },
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Value",
                            hintStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            fillColor: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Divider(height: 10, color: Colors.black),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Colors.red,
                      child: Text('Create IOU',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
