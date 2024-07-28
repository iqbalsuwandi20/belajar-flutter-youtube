import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHidden = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text Field",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          TextField(
            controller: emailC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              label: const Text("Email"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              // prefix: const Padding(
              //   padding: EdgeInsets.only(right: 20),
              //   child: Icon(Icons.email),
              // ),
              prefixIcon: const Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: passwordC,
            autocorrect: false,
            obscureText: isHidden,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              label: const Text("Password"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: const Icon(Icons.vpn_key_off_outlined),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                  // if (isHidden == true) {
                  //   isHidden = false;
                  // } else {
                  //   isHidden = true;
                  // }
                  // setState(() {});
                },
                icon: Icon(
                  isHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                // icon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              print(
                  "Login with Email : (${emailC.text}) and Password : (${passwordC.text})");
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: Colors.red[900],
            ),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
