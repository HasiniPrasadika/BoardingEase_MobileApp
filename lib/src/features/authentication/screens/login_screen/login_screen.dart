import 'package:flutter/material.dart';
import 'package:boarding_ease/src/constants/sizes.dart';
import 'package:boarding_ease/src/features/authentication/screens/get_started_screen/get_started_screen.dart';
import 'package:boarding_ease/src/features/core/screens/dashboard/dashboard.dart';
import 'package:boarding_ease/src/features/core/screens/sell_dashboard/selldashboard.dart';

import '../../../../constants/image_strings.dart';
import 'widgets/login_form_widget.dart';
import 'widgets/login_header_widget.dart';
import 'widgets/login_footer_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  LoginHeaderWidget(),
                  const SizedBox(height: 20.0),
                  LoginForm(),
                  const SizedBox(height: 20.0),
                  LoginFooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
