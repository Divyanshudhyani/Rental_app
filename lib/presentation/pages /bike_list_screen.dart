import 'package:flutter/material.dart';

import 'package:rentapp/data/models/bike.dart';
import 'package:rentapp/presentation/widgets/bike_card.dart';

class BikeListScreen extends StatelessWidget {
  final List<Bike> bikes = [
    Bike(model: 'Royal Enfield Classic', distance: 450, fuelCapacity: 13, pricePerHour: 150),
    Bike(model: 'Yamaha R15', distance: 380, fuelCapacity: 11, pricePerHour: 120),
    Bike(model: 'KTM Duke 390', distance: 420, fuelCapacity: 12, pricePerHour: 180),
    Bike(model: 'Bajaj Pulsar RS200', distance: 400, fuelCapacity: 14, pricePerHour: 100),
    Bike(model: 'Suzuki Gixxer SF', distance: 410, fuelCapacity: 12, pricePerHour: 90),
    Bike(model: 'Honda CBR 250R', distance: 390, fuelCapacity: 13, pricePerHour: 140),
    Bike(model: 'TVS Apache RTR 200', distance: 430, fuelCapacity: 12, pricePerHour: 110),
    Bike(model: 'Hero Xtreme 160R', distance: 460, fuelCapacity: 10, pricePerHour: 80),
    Bike(model: 'Harley Davidson Street 750', distance: 500, fuelCapacity: 15, pricePerHour: 250),
    Bike(model: 'Kawasaki Ninja 300', distance: 480, fuelCapacity: 14, pricePerHour: 200),
    Bike(model: 'Ducati Scrambler', distance: 550, fuelCapacity: 16, pricePerHour: 300),
    Bike(model: 'BMW G310R', distance: 470, fuelCapacity: 13, pricePerHour: 220),
    Bike(model: 'Triumph Street Twin', distance: 530, fuelCapacity: 14, pricePerHour: 280),
    Bike(model: 'Benelli TNT 600i', distance: 520, fuelCapacity: 15, pricePerHour: 270),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose the bike you love.'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: bikes.length,
          itemBuilder: (context , index){
            return BikeCard(bike: bikes[index], index: index);
          }
      ),);

  }
}
