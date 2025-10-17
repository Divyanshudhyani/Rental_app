import 'package:flutter/material.dart';
import 'package:rentapp/data/models/bike.dart';
import 'package:rentapp/presentation/pages%20/MapsDetailsPage.dart';
import 'package:rentapp/presentation/widgets/bike_card.dart';
import 'package:rentapp/presentation/widgets/more_card.dart';

class CardDetailsPage extends StatefulWidget {
  final Bike bike;
  final int index;
  const CardDetailsPage({super.key, required this.bike, required  this.index});

  @override
  State<CardDetailsPage> createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Properly dispose animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            SizedBox(width: 5),
            Text('Information'),
          ],
        ),
      ),
      body: Column(
        children: [
          BikeCard(bike: widget.bike , index: widget.index),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        SizedBox(height: 10),
                        Text('Harsh', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('\$20', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapsDetailsPage(bike: widget.bike),
                        ),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation.value,
                          alignment: Alignment.center,
                          child: Image.asset('assets/maps.jpg', fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  bike: Bike(
                    model: '${widget.bike.model}-1',
                    distance: widget.bike.distance + 100,
                    fuelCapacity: widget.bike.fuelCapacity + 100,
                    pricePerHour: widget.bike.pricePerHour + 10,
                  ),
                ),
                SizedBox(height: 5),
                MoreCard(
                  bike: Bike(
                    model: '${widget.bike.model}-2',
                    distance: widget.bike.distance + 100,
                    fuelCapacity: widget.bike.fuelCapacity + 200,
                    pricePerHour: widget.bike.pricePerHour + 20,
                  ),
                ),
                SizedBox(height: 5),
                MoreCard(
                  bike: Bike(
                    model: '${widget.bike.model}-3',
                    distance: widget.bike.distance + 100,
                    fuelCapacity: widget.bike.fuelCapacity + 300,
                    pricePerHour: widget.bike.pricePerHour + 30,
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
