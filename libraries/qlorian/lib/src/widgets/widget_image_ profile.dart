// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:qlorian/src/widgets/widget_build_image.dart';

// class WidgetImageProfile extends StatelessWidget {
//   final File image;

//   const WidgetImageProfile({
//     super.key,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     double widthSize = size.width;
//     double heightSize = size.height;
//     return Center(
//       child: Stack(
//         children: [
//           BuildImage(),
//           Positioned(
//             right: 0,
//             bottom: 0,
//             child: Container(
//               height: widthSize * 0.0906,
//               width: widthSize * 0.0906,
//               alignment: Alignment.center,
//               decoration: const BoxDecoration(
//                   color: Color(0XFFB4AFEB), shape: BoxShape.circle),
//               child: Icon(
//                 Icons.camera_alt,
//                 color: Colors.white,
//                 size: widthSize * 0.0426,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
