import 'package:flutter/material.dart';
import 'package:minimal/models/car.dart';

class Rental extends ChangeNotifier {
  // Available cars
  final List<Car> _rental = [
    // car 1
    Car(
      id: 1,
      make: "BMW",
      model: "E90",
      rentalPricePerDay: 99.99,
      seatingCapacity: 4,
      availability: true,
      imagePath: "assets/car.jpg",
    ),

    // car 2
    Car(
      id: 1,
      make: "Nissan",
      model: "March",
      rentalPricePerDay: 17.99,
      seatingCapacity: 4,
      availability: true,
      imagePath: "assets/car.jpg",
    ),

    // car 3
    Car(
      id: 1,
      make: "Nissan",
      model: "Bongo",
      rentalPricePerDay: 250.00,
      seatingCapacity: 32,
      availability: true,
      imagePath: "assets/car.jpg",
    ),

    // car 4
    Car(
      id: 1,
      make: "Mazda",
      model: "BT50",
      rentalPricePerDay: 300.00,
      seatingCapacity: 16,
      availability: true,
      imagePath: "assets/car.jpg",
    )
  ];

  // user favorites
  List<Car> _favorite = [];

  // get cars list
  List<Car> get rental => _rental;

  // get user fav
  List<Car> get favorite => _favorite;

  // add to fav
  void addToFavorite(Car car) {
    _favorite.add(car);
    notifyListeners();
  }

  // remove car to fav
  void removeFromFavorite(Car car) {
    _favorite.remove(car);
    notifyListeners();
  }
}
