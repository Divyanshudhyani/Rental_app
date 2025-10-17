
import 'package:flutter/material.dart';

import '../../data/models/bike.dart';

class MoreCard extends StatelessWidget {
  final Bike bike;

  const MoreCard({super.key, required this.bike});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF212020),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bike.model,
                style: TextStyle(color: Colors.white,fontSize: 16 , fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(
                    Icons.directions_bike,color: Colors.white,size: 16,
                  ),
                  SizedBox(width: 5,),
                  Text(
                    '> ${bike.distance} km',
                    style: TextStyle(color : Colors.white , fontSize: 14),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.battery_full , color: Colors.white ,size: 16,),
                  SizedBox(width: 5,),
                  Text(
                    bike.fuelCapacity.toString(),
                    style: TextStyle(color : Colors.white , fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          Icon(Icons.arrow_forward_ios , color: Colors.white, size: 24,)
        ],
      ),
    );
  }
}
