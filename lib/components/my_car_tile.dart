import 'package:flutter/material.dart';
import 'package:minimal/models/car.dart';
import 'package:minimal/models/rental.dart';
import 'package:provider/provider.dart';

class MyCarTile extends StatelessWidget {
  final Car car;

  const MyCarTile({
    super.key,
    required this.car,
  });

  // add to fav
  void addToFavorite(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add to favorites"),
        content:
            Text("Do you want to add ${car.make} ${car.model} to favorites?"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              // Add to fav
              context.read<Rental>().addToFavorite(car);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${car.make} ${car.model} added to favorites"),
                ),
              );
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // car image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    // borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(car.imagePath),
                ),
              ),

              const SizedBox(height: 25),

              // car make
              Text(
                car.make,
                style: const TextStyle(
                  // color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              // model
              Text(
                car.model,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
          // car rental price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // price
              Text(
                "\$${car.rentalPricePerDay.toStringAsFixed(2)}/day",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16,
                ),
              ),

              // add to fav button
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () => addToFavorite(context),
                      icon: const Icon(
                        // Should probably be on condition if car is in fav
                        Icons.favorite_border,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

          // Add to favorites button
        ],
      ),
    );
  }
}
