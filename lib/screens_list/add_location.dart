import 'package:app/router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({Key? key}) : super(key: key);

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  String location = 'Null, Press Button';
  String Address = 'Search';
  String locality = "";
  var serviceEnabled;

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);
    if (serviceEnabled) {
      return await Geolocator.getCurrentPosition();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  //Exact Address Wala Function
  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    locality = place.locality!;
    print(locality);
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    Fluttertoast.showToast(msg: "Address is ${Address.toString()}");
    print(Address.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/addlocation.jpeg",
                    fit: BoxFit.cover),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Location Access is Important !",
                  style: TextStyle(
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 5.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("Provide us your location so that we can",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("show the available services,offers and",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("assign suitable service providers near you",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("to ensure the best service possible",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 45,
                        width: 250,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              color: Color.fromARGB(255, 193, 36, 45),
                            ),
                          ),
                          child: Text('Search Location',
                              style: TextStyle(
                                color: Color.fromARGB(255, 193, 36, 45),
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              )),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 45,
                        width: 250,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 193, 36, 45),
                            ),
                          ),
                          onPressed: () async {
                            Position position = await _determinePosition();
                            location =
                                'Lat: ${position.latitude} , Long: ${position.longitude}';
                            GetAddressFromLatLong(position);
                          },
                          icon: Icon(
                            // <-- Icon
                            Icons.gps_fixed,
                            size: 24.0,
                          ),
                          label: Text(
                            'My Current Location',
                            style: TextStyle(
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontSize: 17),
                          ), // <-- Text
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Text('SKIP For Now',
                            style: TextStyle(
                              color: Color.fromARGB(255, 193, 36, 45),
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.homePage);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
