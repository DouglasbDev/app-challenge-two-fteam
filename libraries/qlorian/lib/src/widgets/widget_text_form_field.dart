import 'package:flutter/material.dart';

class WidgetTextFormField extends StatelessWidget {
  final IconData? prefix;
  final IconData? suffixIcon;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  const WidgetTextFormField({
    super.key,
    this.prefix,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.only(
          left: widthSize * 0.048,
          top: widthSize * 0.0426,
          bottom: widthSize * 0.0426,
        ),
        prefixIcon: Icon(
          prefix,
          size: widthSize * 0.064,
          color: const Color(0xffB4AFEB),
        ),
        suffixIcon: Icon(
          suffixIcon,
          size: widthSize * 0.064,
          color: Colors.grey,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
