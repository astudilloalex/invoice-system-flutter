import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invoice_system/ui/pages/sign-in/controllers/sign_in_controller.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final SignInController controller =
        Get.put<SignInController>(SignInController());
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          // Username input.
          TextFormField(
            controller: controller.usernameController,
            keyboardType: TextInputType.name,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 16.0),
          // Password input.
          Obx(
            () => TextFormField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.visiblePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: controller.passwordVisibility,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: !controller.visiblePassword,
            ),
          ),
          const SizedBox(height: 16.0),
          // Sign in button.
          Obx(
            () => ElevatedButton.icon(
              onPressed: controller.loading ? null : controller.signIn,
              icon: controller.loading
                  ? const SizedBox(
                      height: 18.0,
                      width: 18.0,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : const Icon(Icons.login),
              label: Text(
                controller.loading
                    ? localizations.loading
                    : localizations.signIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
