import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grad_project/pages/home_page.dart';
import 'dart:math';
import '../common/theme_helper.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

String closestPharmcy = "";
Position? current;
double _closeLatitude = 0.0;
double _closeLongitude = 0.0;

List<String> Lab = [
  "Professional ",
  "Al-Najah ",
  "MedLabs",
  "Medicare",
  "Ajyal Lab",
  "Genome Lab"
];
List<List> Insurances = [
  ['Nat Health', "Globe Med", "Tamkeen"],
  ['Nat Health', "Globe Med", "Tamkeen", "Smart Health"],
  ['Nat Health', "Med Service", "Tamkeen", "Smart Health"],
  ['Nat Health', "Globe Med", "Tamkeen", "Smart Health"],
  ['Nat Health', "Globe Med", "Tamkeen", "Smart Health", "Med Service"],
  ['Nat Health', "Globe Med", "Tamkeen"],
];
List<String> Beg_time = [
  "8:00",
  "10:00",
  "9:00",
  "8:00",
  "10:00",
  "9:00",
];
List<String> End_time = ["23:00", "22:00", "23:00", "21:00", "22:00", "23:00"];
List<double> lat = [32.22462, 32.22169, 32.21744, 32.22395, 32.25161, 32.22101];
List<double> lang = [
  35.25646,
  35.26105,
  35.27088,
  35.24047,
  35.26650,
  35.24415
];
List<double> dist = [];

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(32.22300, 35.26263),
    zoom: 15,
  );

  final List<Marker> _markers = <Marker>[];

  @override
  void initState() {
    getloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < Lab.length; i++) {
      _markers.add((Marker(
        markerId: MarkerId(i.toString()),
        position: LatLng(lat[i], lang[i]),
        infoWindow: InfoWindow(
          title: Lab[i],
          onTap: () {
            showAlertDialog(context, i);
          },
        ),
      )));
    }

    _markers.add((Marker(
      markerId: MarkerId('1'),
      position: LatLng(32.22108, 35.25068),
      infoWindow: InfoWindow(
        title: 'nourpharmacyLocation',
        onTap: () {
          showAlertDialog(context, 1);
        },
      ),
    )));

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 198, 223),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            initialCameraPosition: _kGoogle,
            markers: Set<Marker>.of(_markers),
            //  polylines: Set<Polyline>.of(polylines.values),
            mapType: MapType.normal,
            myLocationEnabled: true,
            compassEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),
      // on pressing floating action button the camera will take to user current location
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(10, 370, 280, 0),
        child: Container(
          decoration: ThemeHelper().buttonBoxDecoration(context),
          child: ElevatedButton(
            style: ThemeHelper().buttonStyle(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Icon(Icons.location_on),
            ),
            onPressed: () async {
              print(dist);
              int ind = dist.indexOf(dist.reduce((min)));
              _closeLatitude = lat[ind];
              _closeLongitude = lang[ind];
              print(closestPharmcy);
              print(ind);

              CameraPosition cameraPosition = new CameraPosition(
                target: LatLng(_closeLatitude, _closeLongitude),
                zoom: 15,
              );

              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                  CameraUpdate.newCameraPosition(cameraPosition));
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  Future getloc() async {
    await getUserCurrentLocation().then((value) async {
      current = value;
      print(current!.latitude.toString() + " " + current!.longitude.toString());

      _markers.add(Marker(
        markerId: MarkerId("10"),
        position: LatLng(value.latitude, value.longitude),
        infoWindow: InfoWindow(
          title: ' Current Location',
        ),
      ));

      CameraPosition cameraPosition = new CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      dist = [];
      setState(() {
        for (int i = 0; i < lat.length; i++) {
          double distance1 = calculateDistance(
              lat[i], lang[i], current!.latitude, current!.longitude);
          dist.add(distance1);
        }
      });
    });
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    double p = 0.017453292519943295;
    double a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  showAlertDialog(BuildContext context, int k) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: MediaQuery.of(context).size.height * 0.43,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.004),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color(0xff132137),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      Lab[k],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      Beg_time[k] + "-" + End_time[k],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFB475F).withOpacity(.65),
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Text(
                      "Insurances:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    for (int m = 0; m < Insurances[k].length; m++)
                      text_wed(context, Insurances[k][m], m),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

double ttop = 0;
Widget text_wed(BuildContext context, String s, int i) {
  if (i != 0) ttop = ttop + 0;
  if (i == 0) ttop = 10;
  return Padding(
    padding: EdgeInsets.only(left: 10, top: ttop),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Text(
        s,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.w500),
      ),
    ),
  );
}
