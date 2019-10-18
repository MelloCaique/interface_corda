import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:interface_corda/data/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Compartilhar extends StatefulWidget {
  @override
  _CompartilharState createState() => _CompartilharState();
}

class _CompartilharState extends State<Compartilhar> {
  var resposta = "";
  var response;
  String test = "";
  final _peerController = new TextEditingController();
  final _valueController = new TextEditingController();

  postCall() {
    setState(() {
      resposta = postRequest().toString();
    });
  }

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
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              color: Colors.grey.shade300.withOpacity(0.4),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('Compartilhar Máquina',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Status",
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
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Motivo",
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
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "ID Máquina",
                              hintStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              fillColor: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 10, color: Colors.black),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                        RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.red,
                        child: Text('Info Sistema',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                        
                        },
                      ),
                        RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.red,
                        child: Text('Cadastrar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          postCall();
                          test = "Método em construção";
                        },
                      ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(child: Text(test),),
          Container(child: Text(resposta)),
        ],
      ),
    );
  }

  Future<dynamic> postRequest() async {
    return response = await http.post(
      "http://$host:$port//sharedmachineweb/api/nodes/machines/",
    body: {"hashSharedMachine": "12345",
          "operationType": "2",
          "motiveType": "1",
          "observation": "test 123",
          "deviceInfo": {
            "hardware": {
              "device": "falcon_umtsds",
              "board": "MSM8226",
              "brand": "motorola",
              "display": "NZH54B",
              "hardware": "qcom",
              "host": "Speedhorn",
              "id": "NZH54B",
              "manufacturer": "motorola",
              "model": "Moto G",
              "product": "aosp_falcon",
              "fingerprint":
                  "motorola/falcon_retbr_ds/falcon_umtsds:5.1/LPB23.13-56/58:user/release-keys",
              "serial": "0428078038",
              "radio_version": "MSM8626BP_1032.3116.98.00R",
              "wifi_mac": "40:78:6A:2A:0E:63",
              "bluetooth_mac": "40:78:6A:2A:0E:62",
              "nof_slots": "2",
              "imeis": ["353313064308752", "353313064308760"]
            },
            "os": {
              "base": "",
              "codename": "Stable",
              "build_tags": "release-keys",
              "build_type": "user",
              "incremental": "10",
              "release": "7.1.2",
              "security_patch": "2017-07-05",
              "preview_sdk": "0",
              "sdk": "25"
            },
            "sim": [
              {
                "icc_id": "89551020439004425502",
                "carrier_name": "Só chamadas de emergência — Vivo",
                "country_iso": "br",
                "mcc": "724",
                "mnc": "10",
                "data_roaming": "false",
                "slot_index": "0"
              }
            ],
            "comp": {
              "bootloader_version": "0x411A",
              "user_device_id": "",
              "supported_abis": ["armeabi-v7a", "armeabi"],
              "wv_ua":
                  "Mozilla/5.0 (Linux; Android 7.1.2; Build/NZH54B; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36"
            }
          }},
      headers: {"Content-Type": "application/json",
          "Postman-Token": "7d8fc7c5-078d-4ab2-aa66-b0a7465ee64d",
          "cache-control": "no-cache"},
    );
  }
}
