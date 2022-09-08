import 'package:app_challenge_two_fteam/src/views/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:qlorian/qlorian.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
      body: SingleChildScrollView(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          fontWeight: FontWeight.w600,
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
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: widthSize * 0.064),
              const WidgetTextFormField(
                prefix: Icons.email_outlined,
                hintText: 'Douglas@gmail.com',
              ),
              SizedBox(height: widthSize * 0.074),
              const Text('Password',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              SizedBox(
                height: widthSize * 0.064,
              ),
              const WidgetTextFormField(
                prefix: Icons.lock,
                hintText: 'Douglas@gmail.com',
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
                          style:
                              TextStyle(fontSize: 12, color: Color(0xffC4C4C4)),
                        ),
                      )),
                ],
              ),
              SizedBox(height: widthSize * 0.256),
              const WidgetButton(
                title: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: widthSize * 0.08),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(bottom: widthSize * 0.016),
                  height: widthSize * 0.0213,
                  width: widthSize * 0.533,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widthSize * 0.08),
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
