import 'package:flutter/material.dart';
import 'package:minimal/components/my_car_tile.dart';
import 'package:minimal/components/my_drawer.dart';
import 'package:minimal/models/rental.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access cars in rental
    final cars = context.watch<Rental>().rental;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Discover Cars"),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.pushNamed(context, '/favorites');
              },
            ),
          ],
        ),
        drawer: const MyDrawer(),
        body: ListView(
          children: [
            const SizedBox(height: 25),
            // Rental title
            Center(
              child: Text(
                "Cars to rent in Mutare",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            // Rental subtitle

            // Rental cars
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: cars.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  // get each car from rental
                  final car = cars[index];

                  return MyCarTile(car: car);
                },
              ),
            ),
          ],
        ));
  }
}
