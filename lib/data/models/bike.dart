class Bike{
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Bike({required this.model , required this.distance , required this.fuelCapacity , required this.pricePerHour});

  factory Bike.fromMap(Map<String ,dynamic> map){
    return Bike(model: map['model'], distance: map['distance'], fuelCapacity: map['fuelCapacity'], pricePerHour: map['pricePerHour']);
  }
}