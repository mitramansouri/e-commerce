import 'package:e_commerce_front/ui/screens/authentication_screen.dart';
import 'package:e_commerce_front/ui/screens/product_screen.dart';
import 'package:e_commerce_front/ui/screens/shipping_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candleaf',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ShippingScreen(),
    );
  }
}
