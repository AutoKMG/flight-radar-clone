import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _mapController;
  String _countryName = 'USA';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
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
                  padding: EdgeInsets.symmetric(horizontal: 15),
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
                            setState(() {
                              _countryName = value.toString();
                            });
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
                  height: MediaQuery.sizeOf(context).height * 0.60,
                  child: const Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(49.145, 2.09),
                          zoom: 1.5,
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
