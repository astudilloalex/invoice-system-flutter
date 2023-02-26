import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final RxBool _visiblePassword = RxBool(false);
  final RxBool _loading = RxBool(false);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    // TODO: implement onClose
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<String?> signIn() async {
    try {
      _loading(true);
      await Future.delayed(Duration(seconds: 5));
    } finally {
      _loading(false);
    }
    return null;
  }

  void passwordVisibility() => _visiblePassword(!_visiblePassword.value);

  bool get visiblePassword => _visiblePassword.value;
  bool get loading => _loading.value;
}
