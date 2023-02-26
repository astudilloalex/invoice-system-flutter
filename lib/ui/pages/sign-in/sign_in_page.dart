import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invoice_system/ui/pages/sign-in/widgets/sign_in_form.dart';
import 'package:invoice_system/ui/theme/app_theme_colors.dart';
import 'package:invoice_system/utilities/screen/screen_info.dart';
import 'package:invoice_system/utilities/util.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppThemeColors colors =
        Theme.of(context).extension<AppThemeColors>()!;
    final ScreenInfo screenInfo = getIt<ScreenInfo>();
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (!screenInfo.phone(context))
              Expanded(
                flex: screenInfo.desktop(context) ? 6 : 5,
                child: Container(
                  color: colors.primary,
                  width: double.infinity,
                  height: double.infinity,
                  child: const Center(child: Text('Center')),
                ),
              ),
            Expanded(
              flex: screenInfo.desktop(context) ? 2 : 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.appTitle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        AppLocalizations.of(context)!.welcomeBack,
                        textAlign: TextAlign.center,
                      ),
                      const SignInForm(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
