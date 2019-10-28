import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:interface_corda/data/data.dart';

class Compartilhar extends StatefulWidget {
  @override
  _CompartilharState createState() => _CompartilharState();
}

class _CompartilharState extends State<Compartilhar> {
  final _idController = new TextEditingController();
  final _motivoController = new TextEditingController();
  var resposta;
  var dropdownValue;
  var dropdownValue2;

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
                      Text(' Compartilhar Máquina',
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
                            child: DropdownButton<String>(
                                hint: Text('Status'),
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 20,
                                isExpanded: true,
                                elevation: 5,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  ' COMPROMETIDA',
                                  ' SUSPEITA'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new PhysicalModel(
                            color: Colors.white,
                            shadowColor: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 0,
                            child: DropdownButton<String>(
                                hint: Text('motivo'),
                                value: dropdownValue2,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 20,
                                isExpanded: true,
                                elevation: 5,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue2 = newValue;
                                  });
                                },
                                items: <String>[
                                  ' ROUBO',
                                  ' FURTO',
                                  ' SUSPEITA FRAUDE',
                                  ' FRAUDE ALEGADA',
                                  ' OUTRO MOTIVO'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new PhysicalModel(
                          color: Colors.white,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          child: TextFormField(
                            controller: _motivoController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "   Error";
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: " Observação",
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
                            controller: _idController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "   Error";
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: " ID Máquina",
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
                            onPressed: () {},
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
                              onPressed: () async {
                                resposta = await makeRequest();
                                setState(() {
                                  getId();
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> makeRequest() async {
    var url = "http://$host:$port/sharedmachineweb/api/nodes/machines/";

    var response = await http.post(Uri.encodeFull(url),
        headers: {
          "content-type": "application/json",
          "cache-control": "no-cache"
        },
        body: jsonEncode({
          "hashSharedMachine": "00000",
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
          }
        }));

    resposta = response.body;
    print(response.body);
    return (response.body);
  }

  getId() async {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'ID Máquina Compartilhada',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              backgroundColor: Colors.blue.shade900,
              centerTitle: true,
            ),
            body: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.blueGrey,
                      Colors.blue.shade900,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.8, 1.0],
                    tileMode: TileMode.mirror),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Uma máquina foi compartilahda no Ledger com sucesso pelo BRADESCO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  Text(
                    "ID Transação",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(resposta),
                  Divider(),
                ],
              ),
            ),
          );
        });
  }
}
