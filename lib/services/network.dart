import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:interface_corda/widgets/net_inf.dart';

class Network extends StatefulWidget {
  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(31.1028192, -37.2941397);

  // bool isMapCreated = false;

  Marker jpMorgan = Marker(
    markerId: MarkerId("JPMorgan"),
    position: LatLng(40.7553294, -73.9767783),
  );

  Marker bradesco = Marker(
      markerId: MarkerId("Bradesco"), position: LatLng(-23.549636, -46.774741));

  Marker bancoCentral = Marker(
      markerId: MarkerId("BancoCentral"),
      position: LatLng(-23.5598162, -46.6595552));

  Marker bbva = Marker(
      markerId: MarkerId("BBVA"), position: LatLng(40.4220823, -3.7104658));

  Marker boc = Marker(
      markerId: MarkerId("Bank of China"),
      position: LatLng(39.9420273, 116.3800217));

  //changeMapMode() async {
  //  getJsonFile(
  //          "/home/caique/Blockchain_Corda/interface_corda/interface_corda/assets/dark.json")
  //      .then(setMapStyle);
  //}

  //Future<String> getJsonFile(String path) async {
  //  return await rootBundle.loadString(path);
  //}

  //void setMapStyle(String mapStyle) {
  //  mapController.setMapStyle(mapStyle);
  //}

  @override
  Widget build(BuildContext context) {
    //if (isMapCreated) {
    // changeMapMode();
    // }

    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            // isMapCreated = true;
            // changeMapMode();
            // setState(() {});
          },
          markers: {
            bradesco,
            boc,
            bancoCentral,
            bbva,
            jpMorgan,
          },
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 1.0,
          ),
        ),
        new Container(
          color: Colors.grey.withOpacity(0.3),
          width: double.infinity,
          height: 200,
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Card(
                  color: Colors.black.withOpacity(0.3),
                  elevation: 5,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Text("My indentity",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Flexible(
                          flex: 10,
                          child: Container(
                            child: ListView(
                              children: <Widget>[
                                NetInfo("Bradesco", "Xhu823Sjvl3",
                                    "corda.issuer", "Brasil"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Card(
                  color: Colors.black.withOpacity(0.3),
                  elevation: 5,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Text("Notaries",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Flexible(
                          flex: 10,
                          child: Container(
                            child: ListView(
                              children: <Widget>[
                                NetInfo("Notary", "hUydl3278", "corda.notary.simple",
                          "London"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Card(
                  color: Colors.black.withOpacity(0.3),
                  elevation: 5,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Text("Peers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Flexible(
                          flex: 10,
                          child: Container(
                            child: ListView(
                              children: <Widget>[
                               NetInfo("JPMorgan", "849NsjeuK", "corda.issuer", "USA"),
                      NetInfo(
                          "Bradesco", "Xhu823Sjvl3", "corda.issuer", "Brasil"),
                      NetInfo("Banco Central", "2840Hyran", "corda.issuer",
                          "Brasil"),
                      NetInfo("BBVA", "hUy81jh28", "corda.cash", "Spain"),
                      NetInfo("BOC", "59HyrbaK", "corda.issuer", "China"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
