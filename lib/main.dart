import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/theme.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 420),
                child: Container(
                  width: 330,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 22, top: 22),
                        child: Text(
                          "Discover your perfect stay with BoardingEase",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 0, 1, 21)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Text(
                          "Welcome to BoardingEase, where comfort and convenience meet to create your ideal away-from-home experience.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 82, 82, 82)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 22, right: 22, bottom: 22),
                        child: Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 1, 21),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              "Get Started",
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
          ),
        ),
      ),
    );
  }
}
