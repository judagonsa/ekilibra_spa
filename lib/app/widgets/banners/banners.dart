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
        viewportFraction: 0.8,
        scale: 0.9,
        loop: false,
        autoplay: true,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return _Slide(image: images[index]);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 8), // Cambia la posición de la sombra
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
