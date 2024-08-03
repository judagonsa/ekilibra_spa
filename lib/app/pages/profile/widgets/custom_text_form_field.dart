import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.label,
    this.errorMessage,
    this.onChanged,
    this.onTap,
    this.validator,
    this.obscureText = false,
    this.isPhone = false,
    this.isEmail = false,
    this.textEditingController,
  });

  final String? label;
  final String? errorMessage;
  final dynamic Function(String)? onChanged;
  final GestureTapCallback? onTap;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool isPhone;
  final bool isEmail;

  final border = OutlineInputBorder(borderRadius: BorderRadius.circular(10));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onTap: onTap,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isPhone
              ? TextInputType.phone
              : TextInputType.name,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: const BorderSide(color: Colors.red)),
        isDense: true,
        labelStyle: const TextStyle(color: Colors.black),
        focusColor: Colors.black,
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        label: label != null ? Text(label!) : null,
        errorText: errorMessage,
        errorMaxLines: 2,
      ),
    );
  }
}
