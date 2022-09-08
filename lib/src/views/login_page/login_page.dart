import 'package:app_challenge_two_fteam/src/views/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:qlorian/qlorian.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: widthSize * 0.064,
              right: widthSize * 0.064,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Text(
                      '👋 Hello,\n Login now',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: widthSize * 0.0693,
                ),
                Row(
                  children: [
                    const Text(
                      'if you new here/',
                      style: TextStyle(fontSize: 16, color: Color(0xffC4C4C4)),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text(
                        'Create account',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffB9B9B9)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: widthSize * 0.170,
                ),
                const Text(
                  'E-mail',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: widthSize * 0.064),
                WidgetTextFormField(
                  prefix: Icons.email_outlined,
                  hintText: 'Douglas@gmail.com',
                  controller: email,
                ),
                SizedBox(height: widthSize * 0.074),
                const Text('Password',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: widthSize * 0.064,
                ),
                WidgetTextFormField(
                  prefix: Icons.lock,
                  hintText: 'Douglas@gmail.com',
                  suffixIcon: Icons.remove_red_eye_sharp,
                  controller: password,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          top: widthSize * 0.042,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffC4C4C4)),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: widthSize * 0.256),
                WidgetButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                  },
                  title: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: widthSize * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
