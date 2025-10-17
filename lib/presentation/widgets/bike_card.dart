import 'package:flutter/material.dart';
import 'package:rentapp/presentation/pages%20/bike_details_page.dart';
import '../../data/models/bike.dart';

class BikeCard extends StatelessWidget {
  final Bike bike;
  final int index;

  const BikeCard({super.key, required this.bike , required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CardDetailsPage(bike : bike, index : index ))
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5
            )
          ]
        ),
        child: Column(
          children: [
            Image.asset( 'assets/bike_$index.png', height: 120, fit: BoxFit.cover),
            Text(
              bike.model,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            SizedBox(height: 10),

            // Row for GPS and Pump Icons with Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // GPS Icon & Distance
                    Row(
                      children: [
                        Image.asset('assets/gps.png', width: 20, height: 20), // 🔹 Explicit size
                        SizedBox(width: 5), // Adds space between image & text
                        Text('${bike.distance.toStringAsFixed(0)}km'),
                      ],
                    ),

                    SizedBox(width: 15), // Space between GPS & Pump info

                    // Pump Icon & Fuel Capacity
                    Row(
                      children: [
                        Image.asset('assets/pump.png', width: 20, height: 20), // 🔹 Explicit size
                        SizedBox(width: 5),
                        Text('${bike.fuelCapacity.toStringAsFixed(0)}L'),
                      ],
                    ),
                  ],
                ),
                Text('\$${bike.pricePerHour.toStringAsFixed(2)}/h',
                  style: TextStyle(fontSize: 16 ),)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
