import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/style.dart';
import '../../routing/routes.dart';
import '../../widgets/custom.text.dart';

class AuthenticationPage extends StatefulWidget {
  AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final TextEditingController _textNameEditingController =
      TextEditingController();

  final TextEditingController _textPwdEditingController =
      TextEditingController();

  late String userName;

  late String userPwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset("assets/background.jpg",
            height: double.infinity, width: double.infinity, fit: BoxFit.cover),
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login",
                        style: GoogleFonts.roboto(
                            fontSize: 50, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Welcome back to the admin panel.",
                      color: lightGrey,
                      weight: FontWeight.bold,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _textNameEditingController,
                  onChanged: (value) {
                    userName = value;

                    // This callback will be triggered whenever the text in the TextField changes.
                    // You can perform your input validation or manipulation here.
                    // For example, you can restrict the input to only allow certain characters or format the input.
                  },
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "abc@domain.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _textPwdEditingController,
                  onChanged: (value) {
                    userPwd = value;

                    // This callback will be triggered whenever the text in the TextField changes.
                    // You can perform your input validation or manipulation here.
                    // For example, you can restrict the input to only allow certain characters or format the input.
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        CustomText(
                          text: "Remeber Me",
                          color: lightGrey,
                          weight: FontWeight.bold,
                          size: 16,
                        ),
                      ],
                    ),
                    CustomText(
                      text: "Forgot password?",
                      color: active,
                      size: 18,
                      weight: FontWeight.bold,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: handleSubmit,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: const CustomText(
                      text: "Login",
                      color: Colors.black,
                      weight: FontWeight.bold,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(text: "Do not have admin credentials? "),
                  TextSpan(
                      text: "Request Credentials! ",
                      style: TextStyle(color: active))
                ]))
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void handleSubmit() {
    String inputNameText = _textNameEditingController.text;
    String inputPwdText = _textPwdEditingController.text;
    if (inputNameText.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter an user name.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (inputPwdText.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter a password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Perform the desired action with the input text
      // For example, submit it to a backend server.
      Get.offAllNamed(rootRoute);
      print('Submitted text: $inputNameText');
    }
  }
}
