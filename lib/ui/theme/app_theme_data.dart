import 'package:flutter/material.dart';
import 'package:invoice_system/ui/theme/app_theme_colors.dart';
import 'package:invoice_system/ui/theme/colors.dart';

class AppThemeData {
  const AppThemeData._();

  static ThemeData get dark {
    return ThemeData.dark().copyWith();
  }

  static ThemeData get light {
    const AppThemeColors colors = AppThemeColors(
      primary: LightColors.primary,
      secondary: LightColors.secondary,
    );
    return ThemeData.light().copyWith(
      primaryColor: colors.primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[colors],
    );
  }
}
