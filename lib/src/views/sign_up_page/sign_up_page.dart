import 'package:app_challenge_two_fteam/src/views/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:qlorian/qlorian.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0XFF3E3E3F),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: widthSize * 0.064,
            right: widthSize * 0.064,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    '👋 Hello,\n Are you new here',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: widthSize * 0.0693),
              Row(
                children: [
                  const Text(
                    'if you have an account/',
                    style: TextStyle(fontSize: 16, color: Color(0xffC4C4C4)),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xffB9B9B9),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: widthSize * 0.170),
              const Text(
                'Full Name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: widthSize * 0.064),
              const WidgetTextFormField(
                prefix: Icons.person,
                hintText: 'Douglas Oliveira',
              ),
              SizedBox(height: widthSize * 0.074),
              const Text(
                'E-mail',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: widthSize * 0.064),
              const WidgetTextFormField(
                prefix: Icons.email_outlined,
                hintText: 'Douglas@gmail.com',
              ),
              SizedBox(height: widthSize * 0.074),
              const Text(
                'Password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: widthSize * 0.064),
              const WidgetTextFormField(
                prefix: Icons.lock,
                hintText: 'Douglas@gmail.com',
              ),
              SizedBox(height: widthSize * 0.256),
              WidgetButton(
                title: const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              ),
              SizedBox(height: widthSize * 0.08),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(bottom: widthSize * 0.016),
                  height: widthSize * 0.0213,
                  width: widthSize * 0.533,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
