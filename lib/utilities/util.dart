import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final GetIt getIt = GetIt.instance;

void showError(BuildContext context, String message) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(message: message),
  );
}
