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
    phone.addListener(() {
      if (phone.text.startsWith('+55')) {
        setState(() {
          controller.selectedCountry = controller.items
              .firstWhere((element) => element.title == 'Brazil');
        });
      }
    });
    phone.addListener(() {
      if (phone.text.startsWith('+49')) {
        setState(() {
          controller.selectedCountry = controller.items
              .firstWhere((element) => element.title == 'Germany');
        });
      }
    });
    phone.addListener(() {
      if (phone.text.startsWith('+44')) {
        setState(() {
          controller.selectedCountry = controller.items
              .firstWhere((element) => element.title == 'United Kingdom');
        });
      }
    });
    phone.addListener(() {
      if (phone.text.startsWith('+33')) {
        setState(() {
          controller.selectedCountry = controller.items
              .firstWhere((element) => element.title == 'France');
        });
      }
    });
    phone.addListener(() {
      if (phone.text.startsWith('+34')) {
        setState(() {
          controller.selectedCountry = controller.items
              .firstWhere((element) => element.title == 'Spain');
        });
      }
    });
  }

  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final headline1 = Theme.of(context).textTheme.headline1;
    final headline2 = Theme.of(context).textTheme.headline2;
    final headline3 = Theme.of(context).textTheme.headline3;
    final headline4 = Theme.of(context).textTheme.headline4;
    final headline5 = Theme.of(context).textTheme.headline5;
    final headline6 = Theme.of(context).textTheme.headline6;
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
                Text(
                  '🤓 Setting up your,\n profile',
                  style: headline1,
                ),
                SizedBox(height: widthSize * 0.0693),
                Text(
                  'Add your profile photo',
                  style: headline2,
                ),
              ],
            ),
          ),
          SizedBox(height: widthSize * 0.08),
          Container(
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
                  Text(
                    'Display Name',
                    style: headline4,
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
                      if (!RegExp(r'^[a-zA-Z]{4,}(?: [a-zA-Z]+){0,2}$')
                          .hasMatch(text)) {
                        return 'Full Name is invalid';
                      }
                    },
                  ),
                  SizedBox(height: widthSize * 0.074),
                  Text(
                    'Phone',
                    style: headline4,
                  ),
                  SizedBox(height: widthSize * 0.064),
                  WidgetTextFormField(
                    controller: phone,
                    prefix: Icons.phone_android_sharp,
                    hintText: '+55(85)999553194',
                    validator: (text) {
                      if (!RegExp(
                              r'^\+\d{1,2}\(?\d{2}\)?[\s-]?[\s9]?\d{4}-?\d{4}$')
                          .hasMatch(text ?? '')) {
                        return 'Enter a valid Phone';
                      }
                    },
                  ),
                  SizedBox(height: widthSize * 0.074),
                  Text(
                    'CPF',
                    style: headline4,
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
                  Text(
                    'Country',
                    style: headline4,
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
                                Image.network(country.image,
                                    height: widthSize * 0.0693),
                                SizedBox(
                                  width: widthSize * 0.0693,
                                ),
                                Text(
                                  country.title,
                                  style: headline6,
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
            child: Center(
              child: WidgetButton(
                title: Text('Confirm', style: headline5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
