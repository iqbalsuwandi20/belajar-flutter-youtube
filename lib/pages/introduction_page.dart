import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/login_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class IntrodcutionPage extends StatelessWidget {
  const IntrodcutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of introduction first page",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: Lottie.asset(
                'images/lotties/login-first.json',
                fit: BoxFit.contain,
              ),
            ),
            // child: Image.network(
            //   "https://picsum.photos/id/237/200/300",
            //   height: 200,
            // ),
          ),
        ),
        PageViewModel(
          title: "Title of introduction second page",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: Lottie.asset(
                'images/lotties/login-second.json',
                fit: BoxFit.contain,
              ),
            ),
            // child: Image.asset(
            //   "images/image.jpg",
            //   width: 200,
            // ),
          ),
        ),
      ],
      showNextButton: false,
      done: const Text("Login"),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    );
  }
}
