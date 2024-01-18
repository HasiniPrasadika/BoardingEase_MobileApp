import 'package:boarding_ease/src/constants/image_strings.dart';
import 'package:boarding_ease/src/features/authentication/screens/login_screen/login_screen.dart';

import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tGetStartedImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: 330,
                  height: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: ListView(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25, top: 22, bottom: 15, right: 25),
                        child: Text(
                          "Discover your perfect stay with BoardingEase",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 0, 1, 21)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 25, bottom: 15, right: 25),
                        child: Text(
                          "Welcome to BoardingEase, where comfort and convenience meet to create your ideal away-from-home experience.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 82, 82, 82)),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 25, right: 25),
                          child: GetStartedButton()),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({super.key});

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 1, 21),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: const Text(
          'Get Started',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
