import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_system/ui/pages/sign-in/controllers/sign_in_controller.dart';
import 'package:invoice_system/ui/pages/sign-in/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SignInForm(),
          ],
        ),
      ),
    );
  }
}
