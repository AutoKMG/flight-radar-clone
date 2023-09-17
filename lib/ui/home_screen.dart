import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _mapController;
  String _countryName = 'United Kingdom';
  LatLng _sw = const LatLng(49.674, -14.015517);
  LatLng _ne = const LatLng(61.061, 2.0919117);

  List<BoundingCountryBox> boundingList = [
    BoundingCountryBox(
      'USA',
      'United States',
      const LatLng(24.9493, -125.0011),
      const LatLng(49.5904, -66.9326),
    ),
    BoundingCountryBox(
      'CHN',
      'China',
      const LatLng(8.8383436, 73.4997347),
      const LatLng(53.5608154, 134.7754563),
    ),
    BoundingCountryBox(
      'IRL',
      'Ireland',
      const LatLng(51.222, -11.0133788),
      const LatLng(55.636, -5.6582363),
    ),
    BoundingCountryBox(
      'GBR',
      'United Kingdom',
      const LatLng(49.674, -14.015517),
      const LatLng(61.061, 2.0919117),
    ),
    BoundingCountryBox(
      'IND',
      'India',
      const LatLng(6.5546079, 68.1113787),
      const LatLng(35.6745457, 97.395561),
    ),
    BoundingCountryBox(
      'JPN',
      'Japan',
      const LatLng(20.2145811, 122.7141754),
      const LatLng(45.7112046, 154.205541),
    ),
    BoundingCountryBox(
      'DEU',
      'Germany',
      const LatLng(47.2701114, 5.8663153),
      const LatLng(55.099161, 15.0419319),
    ),
    BoundingCountryBox(
      'ESP',
      'Spain',
      const LatLng(27.4335426, -18.3936845),
      const LatLng(43.9933088, 4.5918885),
    ),
    BoundingCountryBox(
      'THA',
      'Thailand',
      const LatLng(5.612851, 97.3438072),
      const LatLng(20.4648337, 105.636812),
    ),
  ];

  void handleSelected() {
    doSetState();
  }

  void doSetState() {
    setState(() {
      _mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(southwest: _sw, northeast: _ne),
          5,
        ),
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    await Future.delayed(const Duration(milliseconds: 500));
    doSetState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/airplane.png'),
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Flight Radar'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.orange,
                            ),
                      ),
                      Text(
                        'Real-time flight tracker'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.orange,
                            ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Select Country',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {
                            for (var element in boundingList) {
                              if (element.id == value) {
                                _sw = element.sw;
                                _ne = element.ne;
                                _countryName = element.name;
                                handleSelected();
                              }
                            }
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'USA',
                              child: Text('United States of America'),
                            ),
                            DropdownMenuItem(
                              value: 'CHN',
                              child: Text('China'),
                            ),
                            DropdownMenuItem(
                              value: 'IRL',
                              child: Text('Ireland'),
                            ),
                            DropdownMenuItem(
                              value: 'GBR',
                              child: Text('United Kingdom'),
                            ),
                            DropdownMenuItem(
                              value: 'IND',
                              child: Text('India'),
                            ),
                            DropdownMenuItem(
                              value: 'JPN',
                              child: Text('Japan'),
                            ),
                            DropdownMenuItem(
                              value: 'DEU',
                              child: Text('Germany'),
                            ),
                            DropdownMenuItem(
                              value: 'ESP',
                              child: Text('Spain'),
                            ),
                            DropdownMenuItem(
                              value: 'THA',
                              child: Text('Thailand'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Air Traffic overy $_countryName'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.orange[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Total flights 123'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.orange[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  constraints:
                      const BoxConstraints(maxHeight: 500, minHeight: 5),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(_sw.latitude, _ne.longitude),
                        ),
                        mapType: MapType.terrain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BoundingCountryBox {
  final String id;
  final String name;
  final LatLng sw;
  final LatLng ne;

  BoundingCountryBox(this.id, this.name, this.sw, this.ne);
}
