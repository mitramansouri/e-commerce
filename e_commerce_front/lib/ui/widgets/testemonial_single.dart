import 'package:flutter/material.dart';

class TestemonialSingle extends StatelessWidget {
  final String profilePicture;
  final String review;
  final String name;
  final int rating; // out of five
  const TestemonialSingle(
      {super.key,
      required this.review,
      required this.name,
      required this.profilePicture,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48), // Image radius
              child: Image.asset(profilePicture, fit: BoxFit.cover),
            ),
          ),
          StarRating(rating: rating),
          Text(
            review,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(name),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int rating; // Rating out of 5

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Center the stars in the row
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.green,
        );
      }),
    );
  }
}
