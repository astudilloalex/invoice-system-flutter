import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_system/src/common.dart';
import 'package:invoice_system/src/user/application/user_service.dart';
import 'package:invoice_system/utilities/util.dart';

class SignInController extends GetxController {
  final UserService _service = getIt<UserService>();
  final SecureLocalData _secureLocalData = getIt<SecureLocalData>();

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
      await _secureLocalData.saveJWT(
        await _service.signIn(
          usernameController.text.trim(),
          passwordController.text,
        ),
      );
    } on HttpException catch (ex) {
      return ex.message;
    } finally {
      _loading(false);
    }
    return null;
  }

  void passwordVisibility() => _visiblePassword(!_visiblePassword.value);

  bool get visiblePassword => _visiblePassword.value;
  bool get loading => _loading.value;
}
