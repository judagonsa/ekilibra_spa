import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Center(child: Text(title)),
              GestureDetector(
                child: const Icon(Icons.close),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
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
                SizedBox(
                  child: TextButton(
                    onPressed: onPressedOne,
                    style: ButtonHelpers().generalButton(context: context),
                    child: Text(titleButtonOne),
                  ),
                ),
                TextButton(
                  onPressed: onPressedTwo,
                  style: ButtonHelpers().generalButton(context: context),
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
