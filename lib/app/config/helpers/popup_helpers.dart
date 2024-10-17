import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
import 'package:flutter/material.dart';

class PopupHelpers {
  Future<void> popupTwoButtons({
    required BuildContext context,
    required bool withIconClose,
    required String title,
    required String description,
    required IconData? icon,
    required String titleButtonOne,
    required String? titleButtonTwo,
    required double height,
    required void Function() onPressedOne,
    required void Function()? onPressedTwo,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Stack(
            children: [
              Center(child: Text(title)),
              if (withIconClose)
                Positioned(
                  height: 20,
                  left: 240,
                  child: GestureDetector(
                    child: const Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
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
                if (icon != null)
                  Icon(
                    icon,
                    size: 30,
                  ),
                if (icon != null) const SizedBox(height: 20),
                SizedBox(
                  child: TextButton(
                    onPressed: onPressedOne,
                    style: ButtonHelpers().generalButton(context: context),
                    child: Text(titleButtonOne),
                  ),
                ),
                if (titleButtonTwo != null)
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
