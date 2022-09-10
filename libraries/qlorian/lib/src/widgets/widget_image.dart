import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class WidgetImage extends StatefulWidget {
  final ImageProvider? image;
  final Function() onPressed;
  const WidgetImage({super.key, this.image, required this.onPressed});

  @override
  State<WidgetImage> createState() => _WidgetImageState();
}

class _WidgetImageState extends State<WidgetImage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return GestureDetector(
      onTap: widget.onPressed,
      child: Stack(
        children: [
          if (widget.image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(widthSize * 0.0853),
              child: Image(
                image: widget.image!,
                height: widthSize * 0.277,
                width: widthSize * 0.277,
                fit: BoxFit.cover,
              ),
            )
          else
            Positioned.fill(
              child: Container(
                color: Colors.red,
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
      ),
    );
  }
}
