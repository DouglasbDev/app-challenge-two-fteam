import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qlorian/qlorian.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ImageProvider? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final imageTemp = File(image.path);
      final teste = FileImage(imageTemp);
      setState(() => this.image = teste);
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize * 0.064),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          '🤓 Setting up your,\n profile',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: widthSize * 0.0693),
                    const Text(
                      'Add your profile photo',
                      style: TextStyle(fontSize: 16, color: Color(0xffC4C4C4)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: widthSize * 0.08),
              Container(
                height: heightSize,
                width: widthSize,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widthSize * 0.032),
                    topRight: Radius.circular(widthSize * 0.032),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: widthSize * 0.0533),
                      child: image != null
                          ? SizedBox(
                              height: widthSize * 0.277,
                              width: widthSize * 0.277,
                              child: WidgetImage(
                                image: image,
                                onPressed: () {
                                  pickImage();
                                },
                              ),
                            )
                          : WidgetCameraButton(
                              onPressed: () {
                                pickImage();
                              },
                            ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: widthSize * 0.064),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Display Name',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: widthSize * 0.064),
                          WidgetTextFormField(
                            controller: name,
                            prefix: Icons.person,
                            hintText: 'Douglas Oliveira',
                          ),
                          SizedBox(height: widthSize * 0.074),
                          const Text(
                            'Phone',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: widthSize * 0.064),
                          const WidgetTextFormField(
                            prefix: Icons.phone_android_sharp,
                            hintText: 'Douglas Oliveira',
                          ),
                          SizedBox(height: widthSize * 0.074),
                          const Text(
                            'Cpf/Cnpj',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: widthSize * 0.064),
                          const WidgetTextFormField(
                            prefix: Icons.person,
                            hintText: '000.000.000-00/00.000.000/0001-00.',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: widthSize * 0.256),
                    const WidgetButton(
                      title: Text(
                        'Confirm',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
