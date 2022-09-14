import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetTextFormField extends StatelessWidget {
  final IconData? prefix;
  final Widget? suffixIcon;
  final String? hintText;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final String? Function(String text)? onChanged;
  const WidgetTextFormField({
    super.key,
    this.prefix,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final headline6 = Theme.of(context).textTheme.headline6;
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return TextFormField(
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          // isDense: true,
          // contentPadding: EdgeInsets.only(
          //   left: widthSize * 0.048,
          //   top: widthSize * 0.0426,
          //   bottom: widthSize * 0.0426,
          // ),
          prefixIcon: Icon(
            prefix,
            size: widthSize * 0.064,
            color: const Color(0xffB4AFEB),
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: headline6),
    );
  }
}
