class Car {
  final int id;
  final String make;
  final String model;
  final double rentalPricePerDay;
  final int seatingCapacity;
  final bool availability;
  final String imagePath;

  Car({
    required this.id,
    required this.make,
    required this.model,
    required this.rentalPricePerDay,
    required this.seatingCapacity,
    required this.availability,
    required this.imagePath,
  });
}
