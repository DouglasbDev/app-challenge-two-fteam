import 'package:flutter/material.dart';

class WidgetCameraButton extends StatefulWidget {
  final Function()? onPressed;
  const WidgetCameraButton({super.key, this.onPressed});

  @override
  State<WidgetCameraButton> createState() => _WidgetCameraButtonState();
}

class _WidgetCameraButtonState extends State<WidgetCameraButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return Stack(
      children: [
        InkWell(
          onTap: widget.onPressed,
          child: Container(
            height: widthSize * 0.277,
            width: widthSize * 0.277,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(widthSize * 0.0853)),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: widthSize * 0.0906,
            width: widthSize * 0.0906,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color(0XFFB4AFEB), shape: BoxShape.circle),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: widthSize * 0.0426,
            ),
          ),
        )
      ],
    );
  }
}
