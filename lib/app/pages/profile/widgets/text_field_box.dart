import 'package:flutter/material.dart';

class Textfieldbox extends StatelessWidget {
  const Textfieldbox({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(15),
    );

    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Observaciones a tener en cuenta...',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.question_mark_sharp,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
