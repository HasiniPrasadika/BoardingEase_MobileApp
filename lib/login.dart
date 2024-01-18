import 'package:flutter/material.dart';
import 'package:boarding_ease/signup.dart';

class LoginBox extends StatelessWidget {
  const LoginBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/theme.jpg"),
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
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 35, right: 35, top: 35),
                        child: Row(
                          children: [
                            const Text(
                              "Username",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 0, 1, 21)),
                            ),
                            const SizedBox(
                              width: 20,
                              height: 35,
                            ),
                            Container(
                              width: 150,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 189, 189, 189),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Row(
                          children: [
                            const Text(
                              "Password ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 0, 1, 21)),
                            ),
                            const SizedBox(
                              width: 18,
                              height: 35,
                            ),
                            Container(
                              width: 150,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 189, 189, 189),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 35, right: 35),
                        child: Text(
                          "Or",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 1, 21)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 189, 189, 189),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 34,
                                    height: 34,
                                    child: Image.asset(
                                      "assets/google.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                    height: 18,
                                  ),
                                  const Text(
                                    "Log in with Google",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: AccountButton()),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 22,
                          right: 22,
                          bottom: 22,
                        ),
                        child: Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 1, 21),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              "Log in",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
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

class AccountButton extends StatefulWidget {
  const AccountButton({super.key});

  @override
  State<AccountButton> createState() => _AccountButtonState();
}

class _AccountButtonState extends State<AccountButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignupBox()),
        );
      },
      child: const Text(
        'You don\'t have an account?',
        style: TextStyle(color: Color.fromARGB(255, 147, 147, 147)),
      ),
    );
  }
}
