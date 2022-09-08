import 'package:flutter/material.dart';

class WidgetTextFormField extends StatelessWidget {
  final IconData? prefix;
  final String? hintText;
  const WidgetTextFormField({super.key, this.prefix, this.hintText});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return TextFormField(
      decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xffE7E6F8)),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xffE7E6F8))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xffE7E6F8))),
          prefixIcon: Icon(
            prefix,
            size: 24,
            color: const Color(0xffB4AFEB),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xffC0C0C0))),
    );
  }
}
