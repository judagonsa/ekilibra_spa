import 'package:flutter/material.dart';

class PopupHelpers {
  Future<void> popupTwoButtons({
    required BuildContext context,
    required String title,
    required String description,
    required String titleButtonOne,
    required String titleButtonTwo,
    required double height,
    required void Function() onPressedOne,
    required void Function() onPressedTwo,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text(title)),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          content: SizedBox(
            height: height,
            child: Column(
              children: [
                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onPressedOne,
                  child: Text(titleButtonOne),
                ),
                ElevatedButton(
                  onPressed: onPressedTwo,
                  child: Text(titleButtonTwo),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
