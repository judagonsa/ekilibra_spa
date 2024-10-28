import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        autoplay: true,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              images[index],
              fit: BoxFit.fill,
            ),
          );
        },
        viewportFraction: 0.8,
        scale: 0.9,
        loop: false,
      ),
    );
  }
}
