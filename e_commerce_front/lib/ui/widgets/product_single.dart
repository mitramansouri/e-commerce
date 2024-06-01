import 'package:flutter/material.dart';

class ProductSignle extends StatelessWidget {
  final String title;
  final String picture;
  final String price;
  const ProductSignle(
      {super.key,
      required this.title,
      required this.picture,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(picture)),
            Text(title, style: const TextStyle(fontSize: 16.0)),
            Text(
              price,
              style: const TextStyle(fontSize: 10.0, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
