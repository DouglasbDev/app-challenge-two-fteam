import 'package:flutter/material.dart';

class WidgetButton extends StatefulWidget {
  final Widget? title;
  final Function()? onPressed;
  const WidgetButton({super.key, this.title, this.onPressed});

  @override
  State<WidgetButton> createState() => _WidgetButtonState();
}

class _WidgetButtonState extends State<WidgetButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return Material(
      color: const Color(0xff918AE2),
      borderRadius: BorderRadius.circular(widthSize * 0.0373),
      child: InkWell(
        borderRadius: BorderRadius.circular(widthSize * 0.0373),
        onTap: widget.onPressed,
        child: Container(
          height: widthSize * 0.154,
          width: widthSize * 0.872,
          alignment: Alignment.center,
          child: widget.title,
        ),
      ),
    );
  }
}
