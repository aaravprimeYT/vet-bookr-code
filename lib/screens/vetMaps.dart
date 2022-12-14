import 'dart:convert';

import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/models/sizeConfig.dart';
import 'package:vet_bookr/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:vet_bookr/models/total_data_vet.dart';
import 'package:vet_bookr/models/vet_clinic.dart';

class VetsMaps extends StatefulWidget {
  const VetsMaps({Key? key}) : super(key: key);

  @override
  State<VetsMaps> createState() => _VetsMapsState();
}

class _VetsMapsState extends State<VetsMaps> {
  late GoogleMapController googleMapController;

  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';

  Future<Position> determinePosition() async {
    ///Check if location is enabled
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return Future.error(_kLocationServicesDisabledMessage);
    }

    /**
     * Request Location Permission
     */
    await Geolocator.requestPermission();

    ///Check if the kind of permission we got

    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      return Future.error(_kPermissionDeniedMessage);
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error(_kPermissionDeniedForeverMessage);
    }

    return Geolocator.getCurrentPosition();
  }

  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  Set<Marker> _markers = Set<Marker>();

  Future<List<double>> getLatLng() async {
    Position position = await determinePosition();
    List<double> latLong = [position.latitude, position.longitude];

    return latLong;
  }

  late VetClinic vetClinic;

  Future<TotalVetData> getTotalData() async {
    List<double> latLng = await getLatLng();

    String vetsUrl = "https://www.google.com/maps/dir/?api=1"
        "&origin=${latLng[0]}&2C${latLng[1]}&destination=${vetClinic.placeId}&travelmode=driving&key=${Constants.apiKey}";

    ///Getting the data
    final response = await http.get(Uri.parse(vetsUrl));

    final Map<String, dynamic> data = jsonDecode(response.body);

    // print(data);

    List<VetClinic> vetClinics = (data["results"] as List)
        .map((vetJson) => VetClinic.fromJson(vetJson))
        .toList();

    /**
     * Adding the markerss
     */

    for (vetClinic in vetClinics) {
      final marker = Marker(
        markerId: MarkerId(vetClinic.placeId),
        position: LatLng(vetClinic.lat.toDouble(), vetClinic.lng.toDouble()),
        infoWindow: InfoWindow(
          title: vetClinic.name,
          snippet: vetClinic.address,
        ),
      );
      _markers.add(marker);
    }

    return TotalVetData(
        usersLat: latLng[0], usersLng: latLng[1], vetClinics: vetClinics);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Vets near you',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
         // sBox(w: 1),
          Image.asset(
            "assets/detailsscreen.png",
          ),
         // sBox(w: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vetClinic.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            //  sBox(h: 1),
              Text(
                vetClinic.address,
                style: TextStyle(fontSize: 15),
              ),
              //sBox(h: 1),
              FutureBuilder<TotalVetData>(
                  future: getTotalData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      return Container(
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(snapshot.data!.usersLat,
                                snapshot.data!.usersLng),
                            zoom: 11.0,
                          ),
                          markers: _markers,
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    }

                    return CircularProgressIndicator();
                  }),
            ],
          )
        ],
      ),
    );
  }
}
