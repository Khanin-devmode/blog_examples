import 'package:dark_mode_theme_extension/themes/design_system_colors.dart';
import 'package:dark_mode_theme_extension/themes/light_theme.dart';
import 'package:flutter/material.dart';

extension ThemeColorGetter on BuildContext {
  DesignSystemColors get designSystemsColors =>
      Theme.of(this).extension<DesignSystemColors>() ?? lightThemeColors;
}
