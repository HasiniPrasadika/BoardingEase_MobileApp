import 'package:boarding_ease/src/constants/image_strings.dart';
import 'package:boarding_ease/src/constants/sizes.dart';
import 'package:boarding_ease/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'form_header_widget.dart';
import 'signup_footer_widget.dart';
import 'signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(tGetStartedImage),
              fit: BoxFit.cover,
              opacity: 20,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 254, 233, 199).withOpacity(0.7)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: const Column(
                children: [
                  FormHeaderWidget(
                    image: tWelcomeScreenImage,
                    title: tSignUpTitle,
                    subTitle: tSignUpSubTitle,
                    imageHeight: 0.15,
                  ),
                  SignUpFormWidget(),
                  SignUpFooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
