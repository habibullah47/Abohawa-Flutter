import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String locationMessage = 'Give me permission to get the location';

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location is enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //Location Services are not enabled, don't continue
      //accessing the position and request users  of the App
      //to enable the location services.
      setState(() {
        locationMessage = 'Location Services are disabled';
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // Permission are denied forever, handle appropriately.
      setState(() {
        locationMessage = 'Location permission are denied forever';
      });
      return;
    }

    //When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      locationMessage =
          "Latitude: ${position.latitude} and longitude: ${position.longitude}";
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            _getCurrentLocation();
            var x = _getCurrentLocation();
            Position position = await Geolocator.getCurrentPosition();
            print(
                'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
            print("Current Location is ${x}");
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
