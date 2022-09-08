import 'package:flutter/material.dart';

class WidgetCameraButton extends StatelessWidget {
  const WidgetCameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return Stack(
      children: [
        Container(
          height: widthSize * 0.277,
          width: widthSize * 0.277,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(32)),
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
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
