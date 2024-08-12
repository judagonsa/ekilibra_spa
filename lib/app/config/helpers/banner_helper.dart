import 'package:flutter/material.dart';

class BannerHelper {
  void showBanner({
    required BuildContext context,
    required String text,
  }) =>
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          elevation: 5,
          backgroundColor: Colors.red,
          content: Center(child: Text(text)),
          contentTextStyle: const TextStyle(color: Colors.white),
          actions: const [
            SizedBox(),
          ],
          onVisible: () {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
            );
          },
        ),
      );
}
