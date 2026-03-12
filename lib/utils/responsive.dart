import 'package:flutter/material.dart';

extension ResponsiveExt on BuildContext {
  Size get _size => MediaQuery.of(this).size;

  // Gets padding for notches/status bars
  EdgeInsets get _padding => MediaQuery.of(this).padding;

  // Usable height (excludes status bar and bottom nav)
  double get usableHeight => _size.height - _padding.top - _padding.bottom;

  /// Height in % of USABLE screen
  double hp(double percent) => usableHeight * (percent / 100);

  /// Width in %
  double wp(double percent) => _size.width * (percent / 100);

  /// Scaling based on reference width (fonts, padding)
  double sp(double size, {double baseWidth = 390}) {
    // Basic scaling
    double scale = _size.width / baseWidth;
    // Add a cap so fonts don't get TOO huge on tablets
    return size * (scale > 1.2 ? 1.2 : scale);
  }

  bool get isPhone => _size.width < 600;

  bool get isTablet => _size.width >= 600 && _size.width < 1024;

  bool get isDesktop => _size.width >= 1024;
}
