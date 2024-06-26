import 'package:flutter/material.dart';
import 'package:boarding_ease/src/constants/image_strings.dart';
import 'package:boarding_ease/src/constants/sizes.dart';
import 'package:boarding_ease/src/constants/text_strings.dart';
import 'package:boarding_ease/src/features/authentication/screens/signup_screen/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: tFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0),
            onPressed: () {},
            label: const Text(
              tSignInWithGoogle,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          child: Text.rich(
            TextSpan(
              text: tDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: tSignup,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
