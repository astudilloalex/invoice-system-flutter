import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_system/src/user/domain/repositories/user_repository.dart';
import 'package:invoice_system/src/user/domain/responses/sign_in_response.dart';
import 'package:invoice_system/src/user/infrastructure/http_user_repository.dart';
import 'package:invoice_system/utilities/util.dart';

class SignInController extends GetxController {
  final UserRepository _repository = getIt<UserRepository>();

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
      await _repository.signIn(
        usernameController.text.trim(),
        passwordController.text,
      );
    } finally {
      _loading(false);
    }
    return null;
  }

  void passwordVisibility() => _visiblePassword(!_visiblePassword.value);

  bool get visiblePassword => _visiblePassword.value;
  bool get loading => _loading.value;
}
