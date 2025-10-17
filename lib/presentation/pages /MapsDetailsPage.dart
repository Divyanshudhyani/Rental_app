import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rentapp/data/models/bike.dart';

class MapsDetailsPage extends StatelessWidget {
  final Bike bike;

  const MapsDetailsPage({super.key, required this.bike});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: MapController(),
            options: MapOptions(
              initialCenter: LatLng(51.0, -0.09), // ✅ Corrected
              initialZoom: 13,                    // ✅ Corrected
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.rentapp', // ✅ Required
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: bikeDetailsCard(bike: bike),
          )
        ],
      ),
    );
  }
}

Widget bikeDetailsCard({required Bike bike}) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                '${bike.model}', // 🔴 Fix: Use actual bike name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.directions_bike, color: Colors.white, size: 16),
                  SizedBox(width: 5),
                  Text('> ${bike.distance} km', // 🔴 Fix: Replace with actual value
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  SizedBox(width: 10),
                  Icon(Icons.battery_full, color: Colors.white, size: 14),
                  SizedBox(width: 5),
                  Text('${bike.fuelCapacity.toString()}', // 🔴 Fix: Replace with actual fuel value
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ],
              )
            ],
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Features" , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                featureIcons(),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${bike.pricePerHour}/day' , style : TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),),
                    ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        child: Text('Book Now', style: TextStyle(color: Colors.white),))
                  ],
                )
              ],
            ),
          ),
        ),

        Positioned(
          top: 50,  // Adjust as needed
          right: 30, // Adjust this to move it inside the dotted area
          child: Image.asset(
            'assets/white_bike.png',
            width: 120,  // Adjust width to fit inside the column
            fit: BoxFit.contain, // Ensure it doesn't overflow
          ),
        ),


      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        featureIcon(Icons.local_gas_station, 'Diesel', 'Common Rail'),
        featureIcon(Icons.speed, 'Acceleration', '0 - 100km/s'),
        featureIcon(Icons.ac_unit, 'Cold', 'Temp Control'),
      ],
  );
}

Widget featureIcon(IconData icon , String title , String subtitle){
  return Container(
    width: 100,
    height: 100,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey , width: 1)
    ),
    child: Column(
      children: [
        Icon(icon , size: 28,),
        Text(title),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey, fontSize: 10),
        )
      ],
    ),
  );
}
