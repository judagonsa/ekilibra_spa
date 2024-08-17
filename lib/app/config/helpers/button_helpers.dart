import 'package:flutter/material.dart';

class ButtonHelpers {
  ButtonStyle primaryButton({
    required bool isLogin,
    Color? textColor,
    Color? backgroundColor,
  }) {
    return TextButton.styleFrom(
      elevation: 1,
      foregroundColor: textColor ?? Colors.white,
      backgroundColor: backgroundColor ?? Colors.red,
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

  ButtonStyle secondaryButton({
    Color? textColor,
    Color? borderColor,
    Color? backgrounColor,
  }) {
    return OutlinedButton.styleFrom(
      backgroundColor: backgrounColor ?? Colors.white,
      elevation: 1,
      foregroundColor: textColor ?? Colors.red,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      side: BorderSide(width: 2, color: borderColor ?? Colors.red),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
