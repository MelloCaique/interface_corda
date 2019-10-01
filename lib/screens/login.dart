import 'package:flutter/material.dart';
import 'package:interface_corda/data/data.dart';
import 'package:interface_corda/screens/menu.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _hostController = new TextEditingController();
  final _portController = new TextEditingController();
  final _userController = new TextEditingController();
  final _passwordController = new TextEditingController();

  acesso() {
    print("outra tela");
    host = _hostController.text; 
    port = _portController.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.asset(
                    'assets/images/logo_escrito.png',
                    height: 70,
                  ),
                )),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                           
                            Flexible(
                              flex: 2,
                              child: Padding(
                                  padding: const EdgeInsets.all(02),
                                  child: new PhysicalModel(
                                    color: Colors.white,
                                    shadowColor: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 0,
                                    child: TextFormField(
                                      controller: _hostController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "   erro";
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Host",
                                        fillColor: Colors.green,
                                      ),
                                    ),
                                  )),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                  padding: const EdgeInsets.all(02),
                                  child: new PhysicalModel(
                                    color: Colors.white,
                                    shadowColor: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 0,
                                    child: TextFormField(
                                      controller: _portController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "   erro";
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Port",
                                        fillColor: Colors.green,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                           
                            Flexible(
                              flex: 3,
                              child: Padding(
                                  padding: const EdgeInsets.all(02),
                                  child: new PhysicalModel(
                                    color: Colors.white,
                                    shadowColor: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 0,
                                    child: TextFormField(
                                      controller: _userController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "   erro";
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "Username",
                                        fillColor: Colors.green,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            
                            Flexible(
                              flex: 3,
                              child: Padding(
                                  padding: const EdgeInsets.all(02),
                                  child: new PhysicalModel(
                                    color: Colors.white,
                                    shadowColor: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 0,
                                    child: TextFormField(
                                      controller: _passwordController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "   erro";
                                        }
                                      },
                                      obscureText: true,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        fillColor: Colors.green,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: Colors.red,
                              child: Text('Conect', style:TextStyle(color: Colors.white)),
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState.validate()) {
                                    print("validou");
                                    acesso();
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}