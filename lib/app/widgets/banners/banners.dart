import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Swiper(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://via.placeholder.com/350x150",
            fit: BoxFit.fill,
          );
        },
        viewportFraction: 0.8,
        scale: 0.9,
        loop: false,
      ),
    );
  }
}
