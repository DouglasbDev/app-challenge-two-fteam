// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';

// class BuildImage extends StatefulWidget {
//   const BuildImage({super.key});

//   @override
//   State<BuildImage> createState() => _BuildImageState();
// }

// class _BuildImageState extends State<BuildImage> {
//   File? image;

//   Future pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);

//       if (image == null) return;
//       final imageTemp = File(image.path);

//       setState(() => this.image = imageTemp);
//     } on PlatformException catch (e) {
//       print('Failed to pick image : $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     double widthSize = size.width;
//     double heightSize = size.height;
//     final imagePath = this.image!.path;
//     final image = imagePath.contains('https://')
//         ? NetworkImage(imagePath)
//         : FileImage(File(imagePath));
//     return Container(
//       height: widthSize * 0.277,
//       width: widthSize * 0.277,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(widthSize * 0.0853),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: Ink.image(
//           image: image as ImageProvider,
//           fit: BoxFit.cover,
//           height: widthSize * 0.277,
//           width: widthSize * 0.277,
//           child: InkWell(onTap: () {
//             final source = image;
//             if (source == null) return;
//           }),
//         ),
//       ),
//     );
//   }
// }
