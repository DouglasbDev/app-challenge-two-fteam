import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qlorian/qlorian.dart';

import '../../controller/country_list.dart';
import '../../model/country.dart';
import '../../model/cpf_mask.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final controller = CountryController();
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

  @override
  void initState() {
    super.initState();
    phone.addListener(() {
      if (phone.text.startsWith('+1')) {
        setState(() {
          controller.selectedCountry = controller.items
              .firstWhere((element) => element.title == 'Estados Unidos');
        });
      }
    });
  }

  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final colorSurface = Theme.of(context).colorScheme.surface;
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: widthSize * 0.064,
              right: widthSize * 0.064,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '🤓 Setting up your,\n profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: widthSize * 0.0693),
                const Text(
                  'Add your profile photo',
                  style: TextStyle(fontSize: 16, color: Color(0xffC4C4C4)),
                ),
              ],
            ),
          ),
          Container(
            // height: heightSize,
            padding: EdgeInsets.only(
              left: widthSize * 0.064,
              right: widthSize * 0.064,
              top: widthSize * 0.064,
            ),
            decoration: BoxDecoration(
              color: colorSurface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widthSize * 0.032),
                topRight: Radius.circular(widthSize * 0.032),
              ),
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: widthSize * 0.08),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: widthSize * 0.0353),
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
                  ),
                  const Text(
                    'Display Name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: widthSize * 0.064),
                  WidgetTextFormField(
                    controller: name,
                    prefix: Icons.person,
                    hintText: 'Douglas Oliveira',
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'This field is required';
                      }
                      if (text.length < 5) {
                        return 'The name is too short';
                      }
                    },
                  ),
                  SizedBox(height: widthSize * 0.074),
                  const Text(
                    'Phone',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: widthSize * 0.064),
                  WidgetTextFormField(
                    controller: phone,
                    prefix: Icons.phone_android_sharp,
                    hintText: '+55(85)999553194',
                    validator: (text) {
                      if (!RegExp(
                              r'^\+\d{2}\(?\d{2}\)?[\s-]?[\s9]?\d{4}-?\d{4}$')
                          .hasMatch(text ?? '')) {
                        return 'Enter a valid Phone';
                      }
                    },
                  ),
                  SizedBox(height: widthSize * 0.074),
                  const Text(
                    'Cpf',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: widthSize * 0.064),
                  WidgetTextFormField(
                    validator: (text) {
                      if (!RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$')
                          .hasMatch(text ?? '')) {
                        return 'Enter a valid CPF';
                      }
                    },
                    inputFormatters: [CpfMask()],
                    prefix: Icons.numbers,
                    hintText: '000.000.000-00',
                  ),
                  SizedBox(height: widthSize * 0.074),
                  const Text(
                    'Country',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: widthSize * 0.064),
                  WidgetDropDown(
                      value: controller.selectedCountry,
                      hint: const Text('Select Country'),
                      items: controller.items.map((country) {
                        return DropdownMenuItem(
                            value: country,
                            child: Row(
                              children: [
                                Image.network(country.image, height: 20),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  country.title,
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                              ],
                            ));
                      }).toList(),
                      onChanged: (Country? country) {
                        setState(() {
                          controller.setValue(country!);
                        });
                      }),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: widthSize * 0.229, bottom: widthSize * 0.0373),
            child: const Center(
              child: WidgetButton(
                title: Text(
                  'Confirm',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
