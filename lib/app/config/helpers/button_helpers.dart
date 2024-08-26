import 'package:flutter/material.dart';

class ButtonHelpers {
  ButtonStyle primaryButton(bool isLogin) {
    return TextButton.styleFrom(
      elevation: 1,
      foregroundColor: Colors.white,
      backgroundColor: Colors.red,
      minimumSize: const Size(88, 36),
      padding: EdgeInsets.only(
          left: isLogin ? 16 : 8,
          right: isLogin ? 16 : 8,
          top: isLogin ? 12 : 6,
          bottom: isLogin ? 12 : 6),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  ButtonStyle secondaryButton() {
    return OutlinedButton.styleFrom(
      elevation: 1,
      foregroundColor: Colors.red,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      side: const BorderSide(width: 2, color: Colors.red),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
