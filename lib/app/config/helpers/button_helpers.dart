import 'package:flutter/material.dart';

class ButtonHelpers {
  ButtonStyle buttonAction() {
    return TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.red,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
