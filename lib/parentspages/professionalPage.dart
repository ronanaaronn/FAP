import 'package:ausome_fap/parentspages/parentsHomePage.dart';
import 'package:ausome_fap/parentspages/professional/maplocation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import 'package:ausome_fap/parentspages/professional/locations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

void main() =>
    runApp(ProPage());
class ProPage extends StatelessWidget {



  late GoogleMapController mapController;
  final Set<Marker> markers = new Set();

    //LatLng _currentPosition;
    LatLng showLocation = new LatLng(14.450758208127482, 121.98515210455578);

  void _onMapCreated(GoogleMapController controller)
  {
    mapController = controller;
    getMyLocation();
  }

  void getMyLocation() async
  {
    showLocation = await setMyLocation();
    print('###############' + showLocation.latitude.toString());
  }

  Future<LatLng> setMyLocation() async
  {
    LatLng pos = new LatLng(0, 0);
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position)
    {
      pos = LatLng(position.latitude, position.longitude);

      mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(pos.latitude, pos.longitude), 14));

      print('==========%%%===========' + pos.latitude.toString());
      print('===========%%%==========' + pos.longitude.toString());
    }).catchError((e) {
      print(e);
    });

    print('=====================' + pos.latitude.toString());
    print('=====================' + pos.longitude.toString());

    return pos;
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => setMyLocation());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: Image.asset('images/autism.png'),
            backgroundColor: Colors.tealAccent,
            title: Row(
              children: <Widget>[
                Text('A',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                ),
                Text('U',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                  ),
                ),
                Text('S',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 30,
                  ),
                ),
                Text('O',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                  ),
                ),
                Text('M',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 30,
                  ),
                ),
                Text('E',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(143.0, 0.0, 0.0, 0.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_sharp,
                      color: Colors.black,
                    ),
                    iconSize: 40,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ParentsHomePage())
                      );
                    },
                  ),
                ),
              ],
            )
        ),
        body:SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding:EdgeInsets.all(20.0),
                  margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.shade100,
                    borderRadius: BorderRadius.circular(10.0),
                    //margin: const EdgeInsets.all(10.0),
                  ),
                  // alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget> [
                      Text(
                        'PROFESSIONAL HELP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                      width: 350,  // or use fixed size like 200
                      height: 440,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(target: showLocation, zoom: 15),
                        onMapCreated: _onMapCreated,
                        myLocationEnabled: true,
                        markers: getmarkers(),
                        )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }



  Set<Marker> getmarkers() { //markers to place on map
    Position _currentPosition;

    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      _currentPosition = position;

      print('=====================' + _currentPosition.latitude.toString());
      print('=====================' + _currentPosition.longitude.toString());

      mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(_currentPosition.latitude, _currentPosition.longitude), 14));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'My Location',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), //Icon for Marker
      ));


    }).catchError((e) {
      print(e);
      print('=====================' + 'ERRORRRR');
    });



    LocationList ll = new LocationList();
    List<MapLocation> _locations = ll.getLocations();
    for(var i=0; i<_locations.length; i++)
      {
        markers.add(Marker( //add second marker
          markerId: MarkerId(showLocation.toString()),
          position: LatLng(_locations[i].latitude, _locations[i].longitude), //position of marker
          infoWindow: InfoWindow( //popup info
            title: _locations[i].title,
            snippet: _locations[i].subtitle,
          ),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
      }
    return markers;
  }

}




// ElevatedButton.icon(
// onPressed: (){Navigator.push(context,MaterialPageRoute(builder:(context) => ParentsHomePage()));},
// icon: Icon(Icons.attractions, color: Colors.greenAccent ),
// label: Text('Sample Button'),
// margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//)