import 'package:flutter/material.dart';
import 'package:minimal/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // header: logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.car_rental,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(height: 25),
              // Tile
              MyListTile(
                text: 'Discover',
                icon: Icons.car_rental,
                onTap: () => Navigator.pop(context),
              ),

              MyListTile(
                text: 'Favorites',
                icon: Icons.favorite,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, '/favorites');
                },
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro', (route) => false),
            ),
          ),

          // cart tile

          // exit
        ],
      ),
    );
  }
}
