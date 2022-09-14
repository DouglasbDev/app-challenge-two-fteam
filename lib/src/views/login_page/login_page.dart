import 'package:app_challenge_two_fteam/src/views/sign_up_page/sign_up_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qlorian/qlorian.dart';

import '../../model/cpf_mask.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool obscuredTextPassword = false;
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
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '👋 Hello,\n Login now',
                  style: headline1,
                ),
                SizedBox(
                  height: widthSize * 0.0693,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'if you new here/',
                        style: headline2,
                      ),
                      TextSpan(
                        text: 'Create account',
                        style: headline3,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()),
                            );
                          },
                      ),
                    ],
                  ),
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
                  Text(
                    'E-mail',
                    style: headline4,
                  ),
                  SizedBox(height: widthSize * 0.064),
                  WidgetTextFormField(
                      prefix: Icons.email_outlined,
                      hintText: 'Douglas@gmail.com',
                      validator: (text) {
                        if (!RegExp(r'[a-zA-Z0-9.-_]+@[a-zA-Z0-9-_]+\..+')
                            .hasMatch(text ?? '')) {
                          return 'Enter a valid email address';
                        }
                        if (text == null || text.isEmpty) {
                          return 'This field is required';
                        }
                      }),
                  SizedBox(height: widthSize * 0.074),
                  Text('Password', style: headline4),
                  SizedBox(
                    height: widthSize * 0.064,
                  ),
                  WidgetTextFormField(
                      prefix: Icons.lock,
                      hintText: 'Password',
                      obscureText: !obscuredTextPassword,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscuredTextPassword = !obscuredTextPassword;
                            });
                          },
                          icon: Icon(obscuredTextPassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'This field is required';
                        }
                        if (text.length < 8) {
                          return 'The password length should be greater than 8';
                        }
                        if (!RegExp(r'[a-z]').hasMatch(text)) {
                          return 'Need one lower case';
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(text)) {
                          return 'Need one Upper case';
                        }
                        if (!RegExp(r'[0-9]').hasMatch(text)) {
                          return 'Need one number case';
                        }
                        if (!RegExp(r'[@#$%!*&><^]').hasMatch(text)) {
                          return 'Need one characters';
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            top: widthSize * 0.042,
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot password?',
                              style: headline6,
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: widthSize * 0.229, bottom: widthSize * 0.0373),
                    child: WidgetButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
                      },
                      title: Text('Login', style: headline5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
