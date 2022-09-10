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
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xffE7E6F8)),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffE7E6F8),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffE7E6F8),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(
            prefix,
            size: 24,
            color: const Color(0xffB4AFEB),
          ),
          suffixIcon: Icon(
            suffixIcon,
            size: 24,
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xffC0C0C0))),
    );
  }
}
