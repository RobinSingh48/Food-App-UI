import 'package:flutter/material.dart';

class PrintRatingStars extends StatelessWidget {
  final int? rating;
  const PrintRatingStars({super.key, this.rating});
  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rating!; i++) {
      stars += '⭐';
    }
    return Text(stars);
  }
}
