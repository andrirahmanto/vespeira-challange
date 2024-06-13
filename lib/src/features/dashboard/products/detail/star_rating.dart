import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;

  const StarRating({super.key, required this.starCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5,
          (index) => index < starCount
              ? const Image(
                  image: AssetImage('assets/icons/icon-star.png'),
                  width: 16,
                  height: 16,
                )
              : const Image(
                  image: AssetImage('assets/icons/icon-star-empty.png'),
                  width: 16,
                  height: 16,
                )),
    );
  }
}
