import 'package:flutter/material.dart';
import 'package:minimal/models/rental.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<Rental>().favorite;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Favorite Cars"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            const SizedBox(height: 25),
            // Rental title
            Expanded(
              child: favorites.isEmpty
                  ? Center(
                      child: Text(
                        "No favorite cars",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final car = favorites[index];
                        return ListTile(
                          title: Text("${car.make} ${car.model}"),
                          subtitle: Text(
                              "Capacity: ${car.seatingCapacity.toString()}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<Rental>().removeFromFavorite(car);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ));
  }
}
