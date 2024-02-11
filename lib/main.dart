import 'package:flutter/material.dart';
import 'package:minimal/models/rental.dart';
import 'package:minimal/pages/favorites_page.dart';
import 'package:minimal/pages/intro_page.dart';
import 'package:minimal/pages/shop_page.dart';
import 'package:minimal/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Rental(),
      child: const Minimal(),
    ),
  );
}

class Minimal extends StatelessWidget {
  const Minimal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro': (context) => const IntroPage(),
        '/shop': (context) => const ShopPage(),
        '/favorites': (context) => const FavoritesPage(),
      },
    );
  }
}
