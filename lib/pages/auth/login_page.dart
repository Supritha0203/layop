import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:layop2/main.dart';
import 'package:layop2/pages/auth/register_page.dart';
import 'package:layop2/pages/student_home.dart';
import 'package:layop2/service/auth_service.dart';
import 'package:layop2/util/app_constant.dart';

import 'package:layop2/widget/k_button.dart';
import 'package:layop2/widget/k_form_field.dart';
import 'package:layop2/widget/k_height.dart';
import 'package:layop2/widget/k_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  String errorMessage = '';
  bool isLoading = false;

  @override
  void dispose() {
    textEmailController.dispose();
    textPasswordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    try {
      await AuthService.signIn(
          email: textEmailController.text.trim(),
          password: textPasswordController.text.trim());
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      // ignore: use_build_context_synchronously
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const StudentHome(),
          ));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message.toString();
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage.toString())));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.horizontalPagePadding,
              vertical: AppConstant.verticalPagePadding),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: const [
                  KText(
                    text: "Login",
                    color: AppConstant.titleTextColor,
                    size: AppConstant.leadingText,
                    weight: FontWeight.w800,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: const [
                  Flexible(
                    child: KText(
                      color: AppConstant.bodyTextColor,
                      text: "Enter your credential to connect you in the app",
                      size: AppConstant.informationText,
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              KFormField(
                controller: textEmailController,
                hint: "Enter your email",
              ),
              const KHeight(height: AppConstant.largeSpace),
              KFormField(
                controller: textPasswordController,
                hint: "Enter your password",
              ),
              const KHeight(height: AppConstant.largeSpace),
              if (!isLoading) KButtonPrimary(text: "Login", function: login),
              if (isLoading) const Center(child: CircularProgressIndicator()),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text("Register"))
            ]),
          )),
    );
  }
}
