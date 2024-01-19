import 'package:flutter/material.dart';
import 'package:boarding_ease/src/constants/text_strings.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tLoginTitle,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
        ),
        const SizedBox(height: 10.0),
        Text(
          "Your doorway to effortless and transparent boarding house reservations.",
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
      ],
    );
  }
}
