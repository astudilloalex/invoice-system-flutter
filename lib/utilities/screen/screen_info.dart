import 'package:flutter/material.dart';
import 'package:invoice_system/utilities/screen/screen_change_points.dart';

/// Manage the screen info in all app.
class ScreenInfo {
  const ScreenInfo({
    this.changePoints = const ScreenChangePoints(),
  });

  final ScreenChangePoints changePoints;

  /// Returns true if the size of the screen is desktop.
  ///
  /// Use [context] to obtain the Media Query.
  bool desktop(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width >= changePoints.desktopChangePoint;
  }

  /// Returns true if the size of the screen is phone.
  ///
  /// Use [context] to obtain the Media Query.
  bool phone(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width < changePoints.tabletChangePoint;
  }

  /// Returns true if the size of the screen is tablet.
  ///
  /// Use [context] to obtain the Media Query.
  bool tablet(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width >= changePoints.tabletChangePoint &&
        width < changePoints.desktopChangePoint;
  }

  /// Returns true if the size of the screen is watch.
  ///
  /// Use [context] to obtain the Media Query.
  bool watch(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width < changePoints.watchChangePoint;
  }

  /// Returns the height of the screen in the current [context].
  double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Returns the width of the screen in the [context].
  double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
